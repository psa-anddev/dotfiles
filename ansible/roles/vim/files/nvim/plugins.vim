call plug#begin(stdpath('data') . '/plugged') "Starts the loading of the plug ins.

Plug 'tpope/vim-repeat' "Allows . command for plugin mappings.
Plug 'tpope/vim-surround' "Surround plugin - Adds operation to change the surrounding tags.

"Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'dracula/vim', { 'as': 'dracula' }

"Git integration
Plug 'tpope/vim-fugitive'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"Lisp/Clojure plugins
Plug 'guns/vim-sexp' "Add textobjects for lispy-like functions and other stuff.
Plug 'tpope/vim-sexp-mappings-for-regular-people' "Add easier mappings to vim-sexp.
Plug 'guns/vim-clojure-static' "Clojure syntax highlighting.
Plug 'Olical/conjure'
Plug 'tpope/vim-salve' "Integration with Leiningen
Plug 'tpope/vim-classpath' "Sets path for the Java classpath.

"LaTex plug ins
Plug 'vim-latex/vim-latex'

"Syntax highlighting for Kotlin
Plug 'udalov/kotlin-vim'

"Bazel
Plug 'google/vim-maktaba'
Plug 'bazelbuild/vim-bazel'

" NERDTree
" Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'

" Gradle / Android
Plug 'hsanson/vim-android'

"Plugin to be able to comment lines 
Plug 'tpope/vim-commentary'
" Plugin to search using Ack/Ag
Plug 'mileszs/ack.vim'

" Language Server client
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-jdtls'

" Debugger Adapter Protocol
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-telescope/telescope-dap.nvim'


" Colour previews
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Keyboard shortcuts help
Plug 'folke/which-key.nvim'

" Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'mhartington/formatter.nvim'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" Coloured parenthesis (for Lisp)
Plug 'p00f/nvim-ts-rainbow'
Plug 'tpope/vim-projectionist'

" Notifications 
Plug 'rcarriga/nvim-notify'

Plug 'vimwiki/vimwiki'

Plug 'mbbill/undotree'
call plug#end() "Ends the loading of the plug ins
filetype plugin indent on "Reenables the filetypes.
