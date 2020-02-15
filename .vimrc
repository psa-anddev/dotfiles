"---- General configuration ----
"Remove compatibility with vi.
set nocompatible
" Add find in subdirectories
set path+=**
" Disable autowrapping
set nowrap

"Installation of Vundle, a package manager for Vim
filetype off "Disabling the filetypes so that the plugin manager can be installed
"Vundle
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

"Lint Checking
Plugin 'vim-syntastic/syntastic'

"Lisp/Clojure plugins
Plugin 'guns/vim-sexp' "Add textobjects for lispy-like functions and other stuff.
Plugin 'tpope/vim-sexp-mappings-for-regular-people' "Add easier mappings to vim-sexp.
Plugin 'guns/vim-clojure-static' "Clojure syntax highlighting.
Plugin 'tpope/vim-fireplace' "Clojure integration with REPL
Plugin 'tpope/vim-salve' "Integration with Leiningen
Plugin 'tpope/vim-classpath' "Sets path for the Java classpath.
Plugin 'venantius/vim-eastwood' "Linter for Clojure

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
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'ryanoasis/vim-devicons'

" Gradle / Android
Plugin 'hsanson/vim-android'

"Plugin for watching man pages with Vim
Plugin 'jez/vim-superman'
"Plugin to be able to comment lines 
Plugin 'tpope/vim-commentary'
" Plugin to search using Ack/Ag
Plugin 'mileszs/ack.vim'
call vundle#end() "Ends the loading of the plug ins
filetype plugin indent on "Reenables the filetypes.

" Show relative line numbers
set relativenumber
" Show the number of the line in the cursor instead of 0
set number

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

" Set ag as search program for ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
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
let g:python2_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python'

"---- Key bindings ----
"Set leader key to comma
let mapleader=","

vmap <leader>x :!pbcopy<CR><CR>
vmap <leader>c :w !pbcopy<CR><CR>
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k
noremap <leader>f :NERDTreeToggle<CR>

"---- NERDTree Configuration -----
let NERDTreeShowHidden=1

"---------- Syntastic configuration ------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_kotlin_checkers = ['kotlinc']
let g:syntastic_kotlin_kotlinc_config_file_enabled = 1
let g:syntastic_clojure_checkers = ['eastwood']

"---- Crontab configurations -------
if has("mac")
	autocmd FileType crontab setlocal nowritebackup
endif
"---------- Tabs as spaces -------------------
set expandtab
set smarttab
set softtabstop=0
set tabstop=8
set shiftwidth=4

" --------- Reminder to use folders
set foldlevelstart=1
