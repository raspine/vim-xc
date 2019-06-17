" Only load this indent file when no other was loaded.
if exists("b:did_indent")
    finish
endif
let b:did_indent = 1

" Seems that all we need to do is to set cindent..
setlocal cindent

" ..and add a couple of words
setlocal cinwords+=par,select
