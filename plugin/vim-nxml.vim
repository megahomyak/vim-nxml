if exists('g:loaded_vim_nxml')
    finish
endif
let g:loaded_vim_nxml = 1

augroup vim_nxml
    autocmd!
    autocmd FileType nxml setlocal indentexpr=vim_nxml#Indent(v:lnum)
    autocmd FileType nxml setlocal indentkeys=o,O,[,]
augroup END
