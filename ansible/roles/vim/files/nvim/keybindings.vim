"Set leader key to comma
let mapleader=" "

lua << EOF
local wk = require('which-key')
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
        f = { function () vim.cmd("GFiles") end, 'find files in repository' },
        F = { function () vim.cmd("GFiles?") end, 'find files in repository with untracked' }
    },
["<leader>"] = { function () vim.cmd("Files") end, "find files" },
L = { function () vim.cmd("Lines") end, "find lines" },
B = { function () vim.cmd("Buffers") end, "find buffers" }
}, { prefix = "<leader>" })
EOF
