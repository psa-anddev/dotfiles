source ~/.config/nvim/general_config.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/keybindings.vim
source ~/.config/nvim/latex_preview.vim
source ~/.config/nvim/ack_config.vim



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
