"---- General configuration ----
"Remove compatibility with vi.
set nocompatible

"Installation of Vundle, a package manager for Vim
filetype off "Disabling the filetypes so that the plugin manager can be installed
set rtp+=~/.vim/bundle/Vundle.vim "Adds the Vundle folder to the runtime path
call vundle#begin() "Starts the loading of the plug ins.

Plugin 'VundleVim/Vundle.vim' "Ensuring that the Vundle plugin is updated.
Plugin 'tpope/vim-repeat' "Allows . command for plugin mappings.
Plugin 'tpope/vim-surround' "Surround plugin - Adds operation to change the surrounding tags.

"Status bar
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'blueshirts/darcula' "Darcula theme

"Git integration
Plugin 'tpope/vim-fugitive'

"Lisp/Clojure plugins
Plugin 'guns/vim-sexp' "Add textobjects for lispy-like functions and other stuff.
Plugin 'tpope/vim-sexp-mappings-for-regular-people' "Add easier mappings to vim-sexp.
Plugin 'guns/vim-clojure-static' "Clojure syntax highlighting.
Plugin 'tpope/vim-fireplace' "Clojure integration with REPL
Plugin 'tpope/vim-salve' "Integration with Leiningen
Plugin 'tpope/vim-classpath' "Sets path for the Java classpath.

"LaTex plug ins
Plugin 'vim-latex/vim-latex'
" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plugin 'xuhdev/vim-latex-live-preview'

"Syntax highlighting for Kotlin
Plugin 'udalov/kotlin-vim'

"Bazel
Plugin 'google/vim-maktaba'
Plugin 'bazelbuild/vim-bazel'

" NERDTree
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'

call vundle#end() "Ends the loading of the plug ins
filetype plugin indent on "Reenables the filetypes.

" Show relative line numbers
set relativenumber

" Enables syntax highlighting
syntax on

" Add LaTex as file type
let g:tex_flavor='latex'
let g:livepreview_previewer = 'open -a Skim'

"Set theme to Darcula
colorscheme darcula

"Set font ligatures for MacVim
if has("gui_macvim") 
	set macligatures
	set guifont=Fira\ Code:h14
endif

" Load filetype-specific indent files
filetype indent on

"Add autocompletion using tab for commands.
set wildmenu

"Set the status bar to appear
set laststatus=2
"Since the status bar will provide the mode, it is not necessary to display it
"anymore.
set noshowmode

"---- Search configurations ----
"Incremental search enabled
set incsearch

"Highlight matches as we type
set hlsearch

"Ignore case for searches
set ignorecase

"---- Python configuration for Neovim
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

"---- Key bindings ----
"Set leader key to comma
let mapleader=","

vmap <leader>x :!pbcopy<CR><CR>
vmap <leader>c :w !pbcopy<CR><CR>
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k

"---- NERDTree Configuration -----
let NERDTreeShowHidden=1
