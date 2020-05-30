"Remove compatibility with vi.
set nocompatible
" Add find in subdirectories
set path+=**
" Disable autowrapping
set nowrap

" Necessary to allow LSP to make modifications in several files
set hidden

" Show relative line numbers
set relativenumber
" Show the number of the line in the cursor instead of 0
set number

" Enables syntax highlighting
syntax on

"Set True Color for Vim
set termguicolors

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

"---------- Tabs as spaces -------------------
set expandtab
set smarttab
set softtabstop=0
set tabstop=8
set shiftwidth=4

" --------- Reminder to use folders
set foldlevelstart=1

