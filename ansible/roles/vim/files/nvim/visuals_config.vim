"Set theme to Darcula
colorscheme dracula

" Disable autowrapping
set nowrap

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

"Set the status bar to appear
set laststatus=2
"Since the status bar will provide the mode, it is not necessary to display it
"anymore.
set noshowmode

