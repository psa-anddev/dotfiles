autocmd BufReadPost *.kt setlocal filetype=kotlin

let g:LanguageClient_serverCommands = {
    \ 'kotlin': ["~/repos/kotlin-language-server/server/build/install/server/bin/kotlin-language-server"],
    \ 'xml': ["java", "-jar", "~/repos/xml-lsp/org.eclipse.lemminx/target/org.eclipse.lemminx-uber.jar"],
    \ 'java': ["~/repos/lsp/java-language-server/dist/lang_server_linux.sh"],
    \ 'tex' : ["~/repos/latex-lsp/texlab"],
    \ 'clojure': ["sh", "-c", "~/repos/clojure-lsp/clojure-lsp"]
    \ }

