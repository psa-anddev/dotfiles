"Set leader key to comma
let mapleader=","

map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k
noremap <leader>f :NERDTreeToggle<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <leader>lgd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <leader>lrr :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> <leader>lrq :call LanguageClient#textDocument_codeAction()<CR>
nnoremap <silent> <leader> :WhichKey '<leader>'<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gw :Gwrite<CR>
nnoremap <leader>gr :Gread<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gl :Glog<CR>
nnoremap <leader>gk :Gpush<CR>
nnoremap <leader>gt :Gpull<CR>
