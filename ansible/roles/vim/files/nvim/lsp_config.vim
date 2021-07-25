"     \ 'xml': ["java", "-jar", "~/repos/xml-lsp/org.eclipse.lemminx/target/org.eclipse.lemminx-uber.jar"],

autocmd BufReadPost *.tex setlocal filetype=tex
lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

-- Mappings.
local wk = require('which-key')
wk.register({ K = { '<Cmd>lua require(\'lspsaga.hover\').render_hover_doc()<CR>', 'hover docs' } }, {})
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
        k = { function () require('lspsaga.signaturehelp').signature_help() end, 'signature help' }, 
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
                q = { function () require('lspsaga.codeaction').code_action() end, 'code actions' }
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
nvim_lsp.texlab.setup{ on_attach = on_attach }
nvim_lsp.clojure_lsp.setup{ on_attach = on_attach }
nvim_lsp.kotlin_language_server.setup { on_attach = on_attach }
nvim_lsp.pyright.setup { on_attach = on_attach }
nvim_lsp.vimls.setup { on_attach = on_attach }
nvim_lsp.hls.setup { on_attach = on_attach }
require('lsp.sumneko_lua').setup(on_attach)

vim.api.nvim_exec([[
augroup jdtls_lsp
    autocmd!
    autocmd FileType java lua require 'lsp.jdtls'.setup() 
augroup END
]], true)

local saga = require 'lspsaga'
saga.init_lsp_saga()
EOF
