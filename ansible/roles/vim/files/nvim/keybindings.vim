"Set leader key to comma
let mapleader=","

vmap <leader>x :!pbcopy<CR><CR>
vmap <leader>c :w !pbcopy<CR><CR>
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k
noremap <leader>f :NERDTreeToggle<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> ,rr :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> ,rq :call LanguageClient#textDocument_codeAction()<CR>

