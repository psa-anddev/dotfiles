source ~/.config/nvim/general_config.vim
source ~/.config/nvim/plugins.vim

" Add LaTex as file type
let g:tex_flavor='latex'
let g:livepreview_previewer = 'open -a Skim'

" Set ag as search program for ack.vim
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

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

" ---- Language Servers ------
autocmd BufReadPost *.kt setlocal filetype=kotlin

let g:LanguageClient_serverCommands = {
    \ 'kotlin': ["~/repos/kotlin-language-server/server/build/install/server/bin/kotlin-language-server"],
    \ 'xml': ["java", "-jar", "~/repos/xml-lsp/org.eclipse.lemminx/target/org.eclipse.lemminx-uber.jar"],
    \ 'java': ["~/repos/dotfiles/scripts/start_java_lsp"]
    \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> ,rr :call LanguageClient#textDocument_rename()<CR>
nnoremap <silent> ,rq :call LanguageClient#textDocument_codeAction()<CR>
