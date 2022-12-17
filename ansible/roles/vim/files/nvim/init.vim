source ~/.config/nvim/general_config.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/visuals_config.vim
source ~/.config/nvim/keybindings.vim
source ~/.config/nvim/ack_config.vim
source ~/.config/nvim/crontab_config.vim
lua require('whichkey')
lua require('finder')
source ~/.config/nvim/lsp_config.vim
source ~/.config/nvim/completion.vim
source ~/.config/nvim/rainbow_config.vim
lua require('dap.config').setup()
lua require('tree-sitter')
lua require('file-browser')
lua require('notifications')
lua require('vimwiki').setup()
