" ext-completer - automatically adds various extensions when opening a file
" Maintainer:   Sergiy Byelozyorov <http://sergiyb.com/>
" Version:      1.0.1

" Avoid installing twice or when in unsupported Vim version.
if exists('g:loaded_ext_completer') || (v:version < 700)
  finish
endif

let g:loaded_ext_completer = 1

" ext-completer will try adding all of these extensions in order, i.e. if there
" is file.py and file.js in the dir and the list contains ["py", "js"], then
" file.py will be opened since it will be tried first.
let g:supported_extensions = ["py", "go", "html", "js"]


function! s:try_open_pyfile()
  for extension in g:supported_extensions
    " Try adding a dot and an extension.
    let file_with_ext = bufname("%") . "." . extension
    if (filereadable(file_with_ext))
      exec ":edit " . file_with_ext
    endif

    " Also try adding just extension (in case dot is already present).
    let file_with_ext = bufname("%") . extension
    if (filereadable(file_with_ext))
      exec ":edit " . file_with_ext
    endif
  endfor
endfunction

autocmd! BufNewFile * nested call s:try_open_pyfile()
