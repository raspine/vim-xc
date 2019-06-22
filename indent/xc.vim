" vim-xc - vim plugin for xmos's xc language.
" Author:       Jörgen Scott (jorgen.scott@gmail.com)

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

" add a couple of words for cindent
setlocal cinwords+=par,select

setlocal indentexpr=XcIndent()

"Seems we only need to make a special case for :> operator
function! s:IsXcOperator(line)
    return a:line =~ ':>'
endfunction

function! XcIndent()
    let line = getline(v:lnum)
    let previousNum = prevnonblank(v:lnum - 1)
    let previousLine = getline(previousNum)

    if s:IsXcOperator(line) || s:IsXcOperator(previousLine)
        return indent(previousNum)
    else
        return cindent(v:lnum)
    endif
endfunction

" vim:set ft=vim sw=4 sts=2 et:
