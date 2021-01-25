nnoremap <leader>G :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>G :<c-u> call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
	let saved_unnamed_register = @@
	if a:type ==# 'v'
		normal! `<v`>y
	elseif a:type ==# 'char'
		normal! `[y`]
	else
		return
	endif

	" this works with toggling quickfix window mappings
  let g:quickfix_return_to_window = winnr()
	let g:quickfix_is_open = 1

	silent execute "grep! -R " . shellescape(@@) . " ."
	copen 15
	redraw!

	let @@ = saved_unnamed_register
endfunction
