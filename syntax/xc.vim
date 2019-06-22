" vim-xc - vim plugin for xmos's xc language.
" Author:       Jörgen Scott (jorgen.scott@gmail.com)
" Original file from Fred Barnes <frmb@kent.ac.uk>.
" Made additions and changes.

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif

" Read C syntax to start with
if version < 600
    so <sfile>:p:h/c.vim
else
    runtime! syntax/c.vim
    unlet b:current_syntax
endif

" XC extensions
syn keyword	xcReserved	auto else return union
syn keyword	xcReserved	break enum short unsigned
syn keyword	xcReserved	case extern signed void
syn keyword	xcReserved	char for sizeof volatile
syn keyword	xcReserved	const if static while
syn keyword	xcReserved	continue int struct
syn keyword	xcReserved	default long switch
syn keyword	xcReserved	do register typedef

syn keyword	xcType		buffered par timer
syn keyword	xcType		chan inline port transaction streaming
syn keyword	xcType		chanend master select when
syn keyword	xcType		timerafter pinseq pinsneq
syn keyword	xcType		clock slave

syn keyword	xcPortType	in out

syn keyword	xcFuture	accept claim goto proc
syn keyword	xcFuture	asm double module restrict
syn keyword	xcFuture	assert float

syn match	xcOper	        "<:|:>|@|>>"
syn match	xcAttr		"\[\[distributable\]\]"
syn match	xcAttr		"\[\[combinable\]\]"
syn match	xcAttr		"\[\[notification\]\]"
syn match	xcAttr		"\[\[clears_notification\]\]"

if version >= 508 || !exists("did_xc_syntax_inits")
    if version < 508
        let did_xc_syntax_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif
    HiLink xcReserved		Type
    HiLink xcType		Type
    HiLink xcPortType		Type
    HiLink xcFuture		Keyword
    HiLink xcOper		Operator
    HiLink xcAttr		Operator
    delcommand HiLink
endif

" vim:set ft=vim sw=4 sts=2 et:
