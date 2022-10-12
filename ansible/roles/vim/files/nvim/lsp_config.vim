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
wk.register({ K = { function () vim.lsp.buf.hover() end, 'hover docs' } }, {})
wk.register({
l = {
        name = "lsp",
        g = {
                name = "go-to",
                D = { function () vim.lsp.buf.declaration() end, 'declaration' },
                d = { function () vim.lsp.buf.definition() end, 'definition' },
                i = {  function () vim.lsp.buf.implementation() end, 'implementation' },
                r = {  function () vim.lsp.buf.references() end, 'references' }
            },
        k = { function () vim.lsp.buf.signature_help() end, 'signature help' }, 
        w = {
                name = "workspace",
                a = { function () vim.lsp.buf.add_workspace_folder() end, 'add folder' },
                r = { function () vim.lsp.buf.remove_workspace_folder() end, 'remove folder' },
                l = { function () print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, 'list folders' } 
            },
        t = {  function () vim.lsp.buf.type_definition() end, 'type definition' },
        r = {
                name = "refactor",
                r = { function () vim.lsp.buf.rename() end, 'rename' },
                q = { function () require('telescope.builtin').lsp_code_actions() end, 'code actions' }
            },
        d = {
                name = 'diagnostics',
                s = { function () vim.lsp.diagnostic.show_line_diagnostics() end, 'show line' },
                p = {  function () vim.lsp.diagnostic.goto_prev() end, 'go to previous' },
                n = {  function () vim.lsp.diagnostic.goto_next() end, 'go to next' },
                l = {  function () vim.lsp.diagnostic.set_loclist() end, 'set local list' }
            },
        [ "=" ] = { function () vim.lsp.buf.formatting() end, 'reformat' } 
    }
}, { prefix = "<leader>" })
end
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
nvim_lsp.texlab.setup{ on_attach = on_attach, capabilities = capabilities }
nvim_lsp.clojure_lsp.setup{ on_attach = on_attach, capabilities = capabilities }
nvim_lsp.kotlin_language_server.setup { on_attach = on_attach, capabilities = capabilities }
nvim_lsp.pyright.setup { on_attach = on_attach, capabilities = capabilities }
nvim_lsp.vimls.setup { on_attach = on_attach, capabilities = capabilities }
nvim_lsp.hls.setup { on_attach = on_attach, capabilities = capabilities }
require('lsp.sumneko_lua').setup(on_attach)
nvim_lsp.racket_langserver.setup{ on_attach = on_attach, capabilities = capabilities }
nvim_lsp.groovyls.setup{
        cmd = { "/usr/lib/jvm/java-11-openjdk/bin/java", "-jar", 
        "/usr/share/java/groovy-language-server/groovy-language-server-all.jar" },
        on_attach = on_attach, 
        capabilities = capabilities
}

vim.api.nvim_exec([[
augroup jdtls_lsp
    autocmd!
    autocmd FileType java lua require 'lsp.jdtls'.setup() 
augroup END
]], true)
EOF
