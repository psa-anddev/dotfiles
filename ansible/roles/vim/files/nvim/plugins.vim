call plug#begin(stdpath('data') . '/plugged') "Starts the loading of the plug ins.

Plug 'tpope/vim-repeat' "Allows . command for plugin mappings.
Plug 'tpope/vim-surround' "Surround plugin - Adds operation to change the surrounding tags.

"Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'doums/darcula' "Darcula theme

"Git integration
Plug 'tpope/vim-fugitive'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"Lisp/Clojure plugins
Plug 'guns/vim-sexp' "Add textobjects for lispy-like functions and other stuff.
Plug 'tpope/vim-sexp-mappings-for-regular-people' "Add easier mappings to vim-sexp.
Plug 'guns/vim-clojure-static' "Clojure syntax highlighting.
Plug 'tpope/vim-fireplace' "Clojure integration with REPL
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
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" Gradle / Android
Plug 'hsanson/vim-android'

"Plugin for watching man pages with Vim
Plug 'jez/vim-superman'
"Plugin to be able to comment lines 
Plug 'tpope/vim-commentary'
" Plugin to search using Ack/Ag
Plug 'mileszs/ack.vim'

" Language Server client
Plug 'neovim/nvim-lspconfig'
Plug 'mfussenegger/nvim-jdtls'
Plug 'glepnir/lspsaga.nvim'

" FZF plugin
Plug 'junegunn/fzf'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Colour previews
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

" Keyboard shortcuts help
" Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'folke/which-key.nvim'

Plug 'nvim-lua/completion-nvim'
Plug 'mhartington/formatter.nvim'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Coloured parenthesis (for Lisp)
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-projectionist'
call plug#end() "Ends the loading of the plug ins
filetype plugin indent on "Reenables the filetypes.
