This is a Vim plugin that opens `file.py` if you've asked it to edit `file`. If
`file` exists or `file.py` doesn't, it does not interfere. By default supported
extensions are `.go`, `.py`, `.js` and `.html`, but you may change them by
setting `g:ext_completer_extensions` to you preferred list of values, e.g.

    let g:ext_completer_extensions = ["py", "go", "txt"]

To install this plugin, first install
[Vundle](https://github.com/VundleVim/Vundle.vim) and then add

    Plugin 'rryk/ext-completer'

to your `.vimrc`.
