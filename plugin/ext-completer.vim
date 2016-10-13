" ext-completer - automatically adds various extensions when opening a file
" Maintainer:   Sergiy Byelozyorov <http://sergiyb.com/>
" Version:      1.0.1

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_ext_completer') || (v:version < 700)
  finish
endif
let g:loaded_ext_completer = 1

function! s:try_open_pyfile()
  let pyfile = bufname("%") . ".py"
  if (filereadable(pyfile))
    exec ":edit " . pyfile
  endif

  let gofile = bufname("%") . ".go"
  if (filereadable(gofile))
    exec ":edit " . gofile
  endif

  let htmlfile = bufname("%") . ".html"
  if (filereadable(htmlfile))
    exec ":edit " . htmlfile
  endif
endfunction

autocmd! BufNewFile * nested call s:try_open_pyfile()
