"Set leader key to comma
let mapleader=" "

lua << EOF
local wk = require('which-key')
wk.register({
f = { "<cmd>NERDTreeToggle<CR>", "toggle file browser" },
g = {
        name = 'git',
        s = { '<cmd>Git<CR>', 'status' },
        w = { '<cmd>Gwrite<CR>', 'stage' },
        r = { '<cmd>Gread<CR>', 'revert changes' },
        c = { '<cmd>Git commit<CR>', 'commit' },
        b = { '<cmd>Git blame<CR>', 'blame' }, 
        l = { '<cmd>Git log<CR>', 'log' },
        k = { '<cmd>Git push<CR>', 'push' },
        t = { '<cmd>Git pull<CR>', 'pull' },
        m = { '<cmd>Git mergetool<CR>', 'merge tool' },
        f = { '<cmd>GFiles<CR>', 'find files in repository' },
        F = { '<cmd>GFiles?<CR>', 'find files in repository with untracked' }
    },
["<leader>"] = { "<cmd>Files<CR>", "find files" },
L = { "<cmd>Lines<CR>", "find lines" },
B = { "<cmd>Buffers<CR>", "find buffers" }
}, { prefix = "<leader>" })
EOF
