"---- General configuration ----
"Remove compatibility with vi.
set nocompatible
" Add find in subdirectories
set path+=**
" Disable autowrapping
set nowrap

"vim-plug
call plug#begin(stdpath('data') . '/plugged') "Starts the loading of the plug ins.

Plug 'tpope/vim-repeat' "Allows . command for plugin mappings.
Plug 'tpope/vim-surround' "Surround plugin - Adds operation to change the surrounding tags.

"Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'blueshirts/darcula' "Darcula theme

"Git integration
Plug 'tpope/vim-fugitive'

"Lint Checking
" Plug 'vim-syntastic/syntastic'

"Lisp/Clojure plugins
Plug 'guns/vim-sexp' "Add textobjects for lispy-like functions and other stuff.
Plug 'tpope/vim-sexp-mappings-for-regular-people' "Add easier mappings to vim-sexp.
Plug 'guns/vim-clojure-static' "Clojure syntax highlighting.
Plug 'tpope/vim-fireplace' "Clojure integration with REPL
Plug 'tpope/vim-salve' "Integration with Leiningen
Plug 'tpope/vim-classpath' "Sets path for the Java classpath.
" Plug 'venantius/vim-eastwood' "Linter for Clojure

"LaTex plug ins
Plug 'vim-latex/vim-latex'
" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plug 'xuhdev/vim-latex-live-preview'

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
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" FZF plugin
Plug 'junegunn/fzf'

" Colour previews
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
call plug#end() "Ends the loading of the plug ins
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

"Set True Color for Vim
set termguicolors

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
" let g:python2_host_prog = '/usr/local/bin/python2'
" let g:python3_host_prog = '/usr/local/bin/python'

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

" ---- Language Servers ------
autocmd BufReadPost *.kt setlocal filetype=kotlin

let g:LanguageClient_serverCommands = {
    \ 'kotlin': ["~/repos/kotlin-language-server/server/build/install/server/bin/kotlin-language-server"],
    \ 'xml': ["java", "-jar", "~/repos/xml-lsp/org.eclipse.lemminx/target/org.eclipse.lemminx-uber.jar"],
    \ 'java': ["~/dotfiles/scripts/start_java_lsp"]
    \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> ,rr :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> ,rq :call LanguageClient#textDocument_codeAction()<CR>
