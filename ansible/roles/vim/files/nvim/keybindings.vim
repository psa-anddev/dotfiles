"Set leader key to comma
let mapleader=" "

lua << EOF
local wk = require('which-key')
local telescope = require('telescope.builtin')
wk.register({
f = { function() vim.cmd("NERDTreeToggle") end, "toggle file browser" },
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
        m = { function () vim.cmd("Git mergetool") end, 'merge tool' },
        f = {
            name = "find",
            f = { function () telescope.git_files() end, 'find files in repository' },
            s = { function () telescope.git_status() end, 'find files in repository that are staged' },
            b = { function () telescope.git_branches() end, 'find branches' },
        }
    },
["<leader>"] = { function () telescope.find_files() end, "find files" },
L = { function () telescope.live_grep() end, "find lines" },
B = { function () telescope.buffers() end, "find buffers" }
}, { prefix = "<leader>" })
EOF
