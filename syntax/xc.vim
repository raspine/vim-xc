" vim-xc - vim plugin for xmos's xc language.
" Author: Jörgen Scott (jorgen.scott@gmail.com)

" quit when a syntax file was already loaded
if exists("b:current_syntax")
    finish
endif

" Read the C syntax to start with
runtime! syntax/c.vim
unlet b:current_syntax

" clear cType to avoid highlight float/double
syn clear cType

" xc supported 'cTypes', may be more than this..
syn keyword	xcType		size_t char short int long unsigned void signed
syn keyword	xcType		int8_t int16_t int32_t int64_t
syn keyword	xcType		uint8_t uint16_t uint32_t uint64_t
syn keyword	xcType		bool

" xc type extensions
syn keyword	xcType          interface server client slave tile core timer
syn keyword	xcType		clock chan chanend port unsafe

" some xmos library extentions
syn keyword	xcType		dsp_complex_t dsp_complex_short_t 

syn keyword     xcStorageClass  auto register static extern typedef service
syn keyword     xcStorageClass  const volatile in out buffered streaming

syn keyword     xcStatement	par select on
syn keyword     xcOperator	timerafter when pinseq pinsneq
syn match	xcOperator      "<:|\:>|@|>>"
syn match	xcAttr		"\[\[distributable\]\]"
syn match	xcAttr		"\[\[combinable\]\]"
syn match	xcAttr		"\[\[notification\]\]"
syn match	xcAttr		"\[\[clears_notification\]\]"

hi def link     xcType		Type
hi def link     xcStorageClass  StorageClass
hi def link     xcStatement     Statement
hi def link     xcOperator	Operator
hi def link     xcAttr		Operator

let b:current_syntax = "xc"

" vim:set ft=vim sw=4 sts=2 et:
