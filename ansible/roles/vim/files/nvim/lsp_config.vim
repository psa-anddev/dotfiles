autocmd BufReadPost *.kt setlocal filetype=kotlin

let g:LanguageClient_serverCommands = {
    \ 'kotlin': ["~/repos/kotlin-language-server/server/build/install/server/bin/kotlin-language-server"],
    \ 'xml': ["java", "-jar", "~/repos/xml-lsp/org.eclipse.lemminx/target/org.eclipse.lemminx-uber.jar"],
    \ 'java': ["~/repos/dotfiles/scripts/start_java_lsp"]
    \ }

