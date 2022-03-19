local M = {}
local server = require('jdtls')

function M.setup()
    local on_attach = function (client, bufnr)
        server.setup_dap()
        require('jdtls.dap').setup_dap_main_class_configs()
        require 'jdtls.setup'.add_commands()
        local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

        buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

        require'formatter'.setup({
            filetype = {
                java = {
                    function()
                        return {
                            exe = os.getenv('HOME') .. '/.local/bin/google-formater',
                            args = { vim.api.nvim_buf_get_name(0) },
                            stdin = true
                        }
                    end
                }
            }
        })

        -- Mappings.
        local wk = require('which-key')
        local jdtls = require('jdtls')

        wk.register({ K = { function() require('lspsaga.hover').render_hover_doc() end, 'hover doc' }}, {})
        wk.register({
            l = {
                name = 'lsp',
                k = { function() require('lspsaga.signaturehelp').signature_help() end, 'signature help' },
                [ "=" ] = { function() vim.cmd("Format") end, "reformat" },
                g = {
                    name = "go to",
                    D = { function () vim.lsp.buf.declaration() end, 'declaration' },
                    d = {  function () vim.lsp.buf.definition() end, 'definition' },
                    i = {  function () vim.lsp.buf.implementation() end, 'implementation' },
                    t = { function () vim.lsp.buf.type_definition() end, 'type definition' },
                    r = {  function () vim.lsp.buf.references() end, 'references' }
                },
                w = {
                    name = "workspace",
                    a = {  function () vim.lsp.buf.add_workspace_folder() end, 'add folder' },
                    r = {  function () vim.lsp.buf.remove_workspace_folder() end, 'remove folder' },
                    l = { function () print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, 'list folders' }
                },
                r = {
                    name = "refactor",
                    r = { function () vim.lsp.buf.rename() end, 'rename' },
                    q = { function () vim.lsp.buf.code_action() end, 'code actions' },
                    o = { function () jdtls.organize_imports() end, 'organize imports' },
                    e = {
                        name = 'extract',
                        v = { function () jdtls.extract_variable() end, 'variable' },
                        c = { function () jdtls.extract_constant() end, 'constant' },
                        m = { function () jdtls.extract_method() end, 'method' }
                    }
                },
                d = {
                    name = "diagnostics",
                    s = { function () vim.lsp.diagnostic.show_line_diagnostics() end, 'show line' },
                    p = { function () vim.lsp.diagnostic.goto_prev() end, 'go to previous' },
                    n = {function () vim.lsp.diagnostic.goto_next() end, 'go to next' },
                    l = {function () vim.lsp.diagnostic.set_loclist() end, 'set local list' },
                },
                t = {
                    name = "test",
                    c = { function() server.test_class() end, "class" },
                    n = { function() server.test_nearest_method() end, "nearest" }
                }
            }
        }, { prefix = "<leader>"})
        wk.register({
            l = {
                name = 'lsp',
                r = {
                    name = "refactor",
                    e = {
                        name = 'extract',
                        v = { '<ESC>:lua require("jdtls").extract_variable(true)<CR>', 'variable' },
                        c = { '<ESC>:lua require("jdtls").extract_constant(true)<CR>', 'constant' },
                        m = { '<ESC>:lua require("jdtls").extract_method(true)<CR>', 'method' }
                    }
                }
            }
        }, { prefix = "<leader>", mode = "v"})
    end
    local config = {
        flags = {
            allow_incremental_sync = true
        },
        on_attach = on_attach,
        root_dir = require('jdtls.setup').find_root({'settings.gradle', 'settings.gradle.kts', 'pom.xml'})

    }
    local bundles = {
        vim.fn.glob(os.getenv("HOME") .. "/repos/dap/java/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar")
    };
    vim.list_extend(bundles, vim.split(vim.fn.glob(os.getenv("HOME") .. "/repos/lsp/java/vscode-java-test/server/*.jar"), "\n"))
    local workspace_path = os.getenv('HOME') .. '/.cache/workspace/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

    config.cmd = {'start_java_lsp', '-data', workspace_path }
    config.on_attach = on_attach
    config.on_init = function(client, _)
        client.notify('workspace/didChangeConfiguration', { settings = config.settings })
    end
    config.settings = {
        ['java.format.settings.url'] = os.getenv('HOME') .. "/.config/java/google-style.xml",
        ['java.format.settings.profile'] = "GoogleStyle"
    }
    config['init_options'] = {
        bundles = bundles
    }
    server.start_or_attach(config)
end

local finders = require'telescope.finders'
local sorters = require'telescope.sorters'
local actions = require'telescope.actions'
local pickers = require'telescope.pickers'
require('jdtls.ui').pick_one_async = function(items, prompt, label_fn, cb)
    local opts = {}
    pickers.new(opts, {
        prompt_title = prompt,
        finder    = finders.new_table {
            results = items,
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = label_fn(entry),
                    ordinal = label_fn(entry),
                }
            end,
        },
        sorter = sorters.get_generic_fuzzy_sorter(),
        attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
                local selection = actions.get_selected_entry(prompt_bufnr)
                actions.close(prompt_bufnr)

                cb(selection.value)
            end)

            return true
        end,
    }):find()
end

return M
