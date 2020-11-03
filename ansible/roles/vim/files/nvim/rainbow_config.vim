let g:rainbow_active = 0

augroup Lisp
    " this one is which you're most likely to use?
    autocmd Filetype clojure,scheme RainbowToggleOn 
augroup end
