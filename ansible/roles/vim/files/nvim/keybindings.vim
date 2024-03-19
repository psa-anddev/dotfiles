"Set leader key to comma
let mapleader=" "
let maplocalleader="\\"

lua << EOF
local wk = require('which-key')
local telescope = require('telescope.builtin')
wk.register({
u = { function() vim.cmd("UndotreeToggle") end, "toggle undo tree" },
f = { function() vim.cmd("NvimTreeToggle") end, "toggle file browser" },
g = {
        name = 'git',
        s = { function () vim.cmd("Git") end, 'status' },
        w = { function () vim.cmd("Gwrite") end, 'stage' },
        r = { function () vim.cmd("Gread") end, 'revert changes' },
        c = { function () vim.cmd("Git commit") end, 'commit' },
        b = { function () vim.cmd("Git blame") end, 'blame' }, 
        l = { function () vim.cmd("Git log") end, 'log' },
        k = { function () vim.cmd("Git push") end, 'push' },
        t = { function () vim.cmd("Git pull") end, 'pull' },
        -- m = { function () vim.cmd("Git mergetool") end, 'merge tool' },
        m = { 
            name = "merge",
            t = { function () vim.cmd("Git mergetool") end, 'tool' },
            h = { function () vim.cmd("diffget //2") end, 'pick left' },
            l = { function () vim.cmd("diffget //3") end, 'pick right' }
        },
        f = {
            name = "find",
            f = { function () telescope.git_files() end, 'find files in repository' },
            s = { function () telescope.git_status() end, 'find files in repository that are staged' },
            b = { function () telescope.git_branches() end, 'find branches' },
        }
    },
a = {
        name = 'alternate',
        o = { function () vim.cmd("A") end, 'open' },
        x = { function () vim.cmd("AS") end, 'open in horizontal split' },
        v = { function () vim.cmd("AV") end, 'open in vertical split' },
        t = { function () vim.cmd("AT") end, 'open in new tab' }
    },
["<leader>"] = { function () telescope.find_files() end, "find files" },
L = { function () telescope.live_grep() end, "find lines" },
B = { function () telescope.buffers() end, "find buffers" },
["="] = { function () vim.cmd("Neoformat") end, 'format with neoformat' }
}, { prefix = "<leader>" })
EOF
