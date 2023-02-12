local latexgroup = vim.api.nvim_create_augroup('latex', { clear = true })

vim.api.nvim_create_autocmd({"BufWritePost"}, {
    pattern = {"*.tex"},
    command = "!pdflatex %",
    group = latexgroup
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.tex"},
    group = latexgroup,
    command = "set ft=tex"
})
