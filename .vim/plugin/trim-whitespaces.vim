augroup trim_whitespaces
    autocmd!
		autocmd BufWritePre * %s/\s\+$//e
augroup END
