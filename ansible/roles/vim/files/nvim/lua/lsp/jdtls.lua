local M = {}

function M.setup()
    local on_attach = function (client, bufnr)
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

        wk.register({ K = { function() require('lspsaga.hover').render_hover_doc() end, 'hover doc' }}, {})
        wk.register({
            l = {
                name = 'lsp',
                k = { function() require('lspsaga.signaturehelp').signature_help() end, 'signature help' },
                [ "=" ] = { "<cmd>Format<CR>", "reformat" },
                t = { function () vim.lsp.buf.type_definition() end, 'type definition' },
                g = {
                    name = "go to",
                    D = { function () vim.lsp.buf.declaration() end, 'declaration' },
                    d = {  function () vim.lsp.buf.definition() end, 'definition' },
                    i = {  function () vim.lsp.buf.implementation() end, 'implementation' },
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
                    q = { function () require('jdtls').code_action() end, 'code actions' }
                },
                d = {
                    name = "diagnostics",
                    s = { function () vim.lsp.diagnostic.show_line_diagnostics() end, 'show line' },
                    p = { function () vim.lsp.diagnostic.goto_prev() end, 'go to previous' },
                    n = {function () vim.lsp.diagnostic.goto_next() end, 'go to next' },
                    l = {function () vim.lsp.diagnostic.set_loclist() end, 'set local list' },
                }
            }
        }, { prefix = "<leader>"})
    end
    local config = {
        flags = {
            allow_incremental_sync = true
        },
        on_attach = on_attach, 
        root_dir = require('jdtls.setup').find_root({'build.gradle', 'build.gradle.kts', 'pom.xml'})

    }
    config.cmd = {'start_java_lsp'}
    config.on_attach = on_attach
    config.on_init = function(client, _)
        client.notify('workspace/didChangeConfiguration', { settings = config.settings })
    end
    config.settings = {
        ['java.format.settings.url'] = os.getenv('HOME') .. "/.config/java/google-style.xml",
        ['java.format.settings.profile'] = "GoogleStyle"
    }
    require('jdtls').start_or_attach(config)
end

return M
