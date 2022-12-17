local M = {}
function M.setup()
    vim.g.vimwiki_list = {
        {
            path = '~/repos/wiki',
            syntax = 'markdown',
            ext = '.md'
        }
    }
end

return M
