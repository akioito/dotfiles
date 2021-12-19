" Vim syntax file
" Language:	PicoLisp

if exists("b:current_syntax")
  finish
endif
setl iskeyword+=?,$,+,*,/,%,=,>,<,!

syn match PicoLispComment /#.*$/
syn region PicoLispCommentRegion start="#{" end="}#"
syn match PicoLispNumber /\v<[-+]?\d+(\.\d+)?>/
syn region PicoLispString start=/"/ skip=/\\\\\|\\"/ end=/"/
syn region PicoLispStringRaw start=/{\$/ end=/\$}/
syn match PicoLispParentheses /[()\[\]]/
syn keyword PicoLispSpecial NIL T This
syn keyword PicoLispDef def redef undef de class extend dm rel var set setq let? let use bind job env up default xchg on off onOff zero one put putl =:
syn keyword PicoLispCond and or not nand nor if ifn if2 when unless cond nond case state at while until loop do for throw catch finally quit abort wait task timeout alarm bye later
syn keyword PicoLispIO in out pool call fork pipe
syn keyword PicoLispDebug test $ !

hi default link PicoLispComment Comment
hi default link PicoLispCommentRegion Comment
hi default link PicoLispNumber Number
hi default link PicoLispString String
hi default link PicoLispStringRaw String
hi default link PicoLispSpecial Constant
hi PicoLispParentheses ctermfg=8 guifg=DarkGrey
hi default link PicoLispDef Define
hi default link PicoLispCond Conditional
hi default link PicoLispIO Identifier
hi default link PicoLispDebug Type

let b:current_syntax = "picolisp"
