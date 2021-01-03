nnoremap <silent> gs :set opfunc=<SID>GoStart<CR>g@
nnoremap <silent> ge :set opfunc=<SID>GoEnd<CR>g@

function! s:GoStart(type) abort
  normal! `[
endfunction

function! s:GoEnd(type) abort
  normal! `]
endfunction
