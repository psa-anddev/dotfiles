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
                D = { '<Cmd>lua vim.lsp.buf.declaration()<CR>', 'declaration' },
                d = { '<Cmd>lua vim.lsp.buf.definition()<CR>', 'definition' },
                i = {  '<cmd>lua vim.lsp.buf.implementation()<CR>', 'implementation' },
                r = {  '<cmd>lua vim.lsp.buf.references()<CR>', 'references' }
            },
        k = { '<cmd>lua require(\'lspsaga.signaturehelp\').signature_help()<CR>', 'signature help' }, 
        w = {
                name = "workspace",
                a = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', 'add folder' },
                r = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', 'remove folder' },
                l = { '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'list folders' } 
            },
        t = {  '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'type definition' },
        r = {
                name = "refactor",
                r = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'rename' },
                q = { '<cmd>lua require(\'lspsaga.codeaction\').code_action()<CR>', 'code actions' }
            },
        d = {
                name = 'diagnostics',
                s = { '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', 'show line' },
                p = {  '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', 'go to previous' },
                n = {  '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', 'go to next' },
                l = {  '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', 'set local list' }
            },
        [ "=" ] = { "<cmd>lua vim.lsp.buf.formatting()<CR>", 'reformat' } 
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
