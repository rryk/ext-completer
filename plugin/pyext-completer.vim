" pyext-completer - automatically adds py extension when opening a file
" Maintainer:   Sergiy Byelozyorov <http://sergiyb.com/>
" Version:      1.0

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_pyext_completer') || (v:version < 700)
  finish
endif
let g:loaded_pyext_completer = 1

function! s:try_open_pyfile()
  let pyfile = bufname("%") . ".py"
  if (filereadable(pyfile))
    exec ":edit " . pyfile
  endif
endfunction

autocmd! BufNewFile * nested call s:try_open_pyfile()
