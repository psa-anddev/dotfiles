"     \ 'xml': ["java", "-jar", "~/repos/xml-lsp/org.eclipse.lemminx/target/org.eclipse.lemminx-uber.jar"],

let g:conjure#mapping#doc_word = v:false
autocmd BufReadPost *.tex setlocal filetype=tex
lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

-- Mappings.
local wk = require('which-key')
local tb = require('telescope.builtin')
wk.register({ K = { function () vim.lsp.buf.hover() end, 'hover docs' } }, {})
wk.register({
l = {
        name = "lsp",
        g = {
                name = "go-to",
                D = { function () vim.lsp.buf.declaration() end, 'declaration' },
                d = { function () tb.lsp_definitions() end, 'definition' },
                i = {  function () tb.lsp_implementations() end, 'implementation' },
                r = {  function () tb.lsp_references() end, 'references' },
                t = {  function () tb.lsp_type_definitions() end, 'type definition' },
            },
        k = { function () vim.lsp.buf.signature_help() end, 'signature help' }, 
        w = {
                name = "workspace",
                a = { function () vim.lsp.buf.add_workspace_folder() end, 'add folder' },
                r = { function () vim.lsp.buf.remove_workspace_folder() end, 'remove folder' },
                l = { function () print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, 'list folders' } 
            },
        r = {
                name = "refactor",
                r = { function () vim.lsp.buf.rename() end, 'rename' },
                q = { function () vim.lsp.buf.code_action() end, 'code actions' }
            },
        d = {
                name = 'diagnostics',
                s = { function () vim.lsp.diagnostic.show_line_diagnostics() end, 'show line' },
                p = {  function () vim.lsp.diagnostic.goto_prev() end, 'go to previous' },
                n = {  function () vim.lsp.diagnostic.goto_next() end, 'go to next' },
                l = {  function () vim.lsp.diagnostic.set_loclist() end, 'set local list' },
                a = {  function () tb.diagnostics() end, 'all diagnostics' },
                b = {  function () tb.diagnostics{bufnr=0} end, 'all diagnostics in buffer' },
            },
        [ "=" ] = { function () vim.lsp.buf.formatting() end, 'reformat' } 
    }
}, { prefix = "<leader>" })
end
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
nvim_lsp.texlab.setup{ on_attach = on_attach, capabilities = capabilities }
nvim_lsp.clojure_lsp.setup{ on_attach = on_attach, capabilities = capabilities }
nvim_lsp.kotlin_language_server.setup { on_attach = on_attach, capabilities = capabilities }
nvim_lsp.pyright.setup { on_attach = on_attach, capabilities = capabilities }
nvim_lsp.vimls.setup { on_attach = on_attach, capabilities = capabilities }
nvim_lsp.hls.setup { on_attach = on_attach, capabilities = capabilities }
nvim_lsp.lua_ls.setup { on_attach = on_attach, capabilities = capabilities }
nvim_lsp.racket_langserver.setup{ on_attach = on_attach, capabilities = capabilities }
nvim_lsp.groovyls.setup{
        cmd = { "/usr/lib/jvm/java-11-openjdk/bin/java", "-jar", 
        "/usr/share/java/groovy-language-server/groovy-language-server-all.jar" },
        on_attach = on_attach, 
        capabilities = capabilities
}
nvim_lsp.bashls.setup{ on_attach = on_attach, capabilities = capabilities }
nvim_lsp.tflint.setup{ on_attach= on_attach, capabilities = capabilities }
nvim_lsp.yamlls.setup{ on_attach= on_attach, capabilities = capabilities }

local util = require 'lspconfig.util'
local function get_typescript_server_path(root_dir)
    -- Alternative location if installed as root:
    -- local global_ts = '/usr/local/lib/node_modules/typescript/lib'
    local found_ts = ''
    local function check_dir(path)
        found_ts =  util.path.join(path, 'node_modules', 'typescript', 'lib')
        if util.path.exists(found_ts) then
            return path
        end
    end

    if util.search_ancestors(root_dir, check_dir) then
        return found_ts
    else
        return '/usr/lib/node_modules/typescript/lib/'
    end
end

nvim_lsp.volar.setup{
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
  on_attach = on_attach,
  capabilities = capabilities,
  on_new_config = function(new_config, new_root_dir)
      new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
  end,
}

nvim_lsp.clangd.setup {
    on_attach = on_attach,
}

vim.api.nvim_exec([[
augroup jdtls_lsp
    autocmd!
    autocmd FileType java lua require 'lsp.jdtls'.setup() 
augroup END
]], true)
EOF
