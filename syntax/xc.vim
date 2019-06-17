" Vim syntax file
" Language:     xc (XMOS C)
" Maintainer:   Fred Barnes  <frmb@kent.ac.uk>
" Last Change:  01/11/2008

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

setlocal conceallevel=2
setlocal concealcursor=nv

syn clear cUserCont
syn match   cppCustomConcealNot       "!" conceal cchar=¬ contains=cppCustomConceal
syn match   cppCustomConceal         "<:" conceal cchar=←
syn match   cppCustomConceal         ":>" conceal cchar=→
syn match   cppCustomConceal         "->" conceal cchar=→
syn match   cppCustomConceal         "=>" conceal cchar=⇒
syn match   cppCustomConceal         "==" conceal cchar=≡
syn match   cppCustomConceal         "\[\[" conceal cchar=⟮
syn match   cppCustomConceal         "\]\]" conceal cchar=⟯
syn match   cppCustomConceal         "!=" conceal cchar=≠"contains=cppCustomConcealNot
syn match   cppCustomConceal         "<=" conceal cchar=≤
syn match   cppCustomConceal         ">=" conceal cchar=≥
syn match   cppCustomConceal         "<<" conceal cchar=≪
syn match   cppCustomConceal         ">>" conceal cchar=≫
syn match   cppCustomConceal         "&&" conceal cchar=∧
syn match   cppCustomConceal         "||" conceal cchar=∨

syn match   xcCustomConst            "XS1_[A-Z_0-9]\+"
syn match   binaryNumber             "0b[01]\+"


hi def link cppCustomConceal Operator
hi def link cppCustomConcealNot Operator
hi def link xcCustomConst Constant
hi Conceal ctermbg=NONE ctermfg=NONE
hi def link binaryNumber Number

" XC extensions
syn keyword	xcReserved	auto else return union
syn keyword	xcReserved	break enum short unsigned
syn keyword	xcReserved	case extern signed void
syn keyword	xcReserved	char for sizeof volatile
syn keyword	xcReserved	const if static while
syn keyword	xcReserved	continue int struct
syn keyword	xcReserved	default long switch
syn keyword	xcReserved	do register typedef interface server client

syn keyword	xcType		buffered par timer
syn keyword	xcType		chan inline port transaction streaming
syn keyword	xcType		chanend master select when
syn keyword	xcType		clock slave 

syn keyword	xcPortType	in out

syn keyword	xcFuture	accept claim goto proc
syn keyword	xcFuture	asm double module restrict
syn keyword	xcFuture	assert float on

syn keyword     Macro          combine combinable

syn keyword     Type       timerafter pinseq pinsneq

"syn match	xcIOOper	"<:\|:>\|@\|>>"

if version >= 508 || !exists("did_xc_syntax_inits")
    if version < 508
        let did_xc_syntax_inits = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif
    HiLink xcReserved		Type
    HiLink xcType			Type
    HiLink xcPortType		Type
    HiLink xcFuture		Keyword
    HiLink xcIOOper		Operator
    delcommand HiLink
endif

let b:current_syntax = "xc"

" vim: ts=8
