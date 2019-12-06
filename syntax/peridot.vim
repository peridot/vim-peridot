
if exists('b:current_syntax')
  finish
endif

let b:current_syntax = "peridot"

" Match TODO comments
syntax keyword peridotTodos TODO XXX FIXME NOTE BUG

" Match language specific keywords
syntax keyword peridotKeywords
      \ if while function class end import return as async await

syn keyword peridotExceptions try catch throw

syn keyword peridotBuiltins println print eval exit

syntax keyword peridotBoolean true false
syn keyword peridotNull null

syn keyword peridotTypes Number String Map Array Exception

syntax match peridotNumber "\v<\d+>"
syntax match peridotNumber "\v<\d+\.\d+>"
syntax match peridotNumber "\v<0x\x+([Pp]-?)?\x+>"
syntax region peridotComment start="#" end="$" contains=peridotTodos

syntax region peridotString start=/"/ skip=/\\"/ end=/"/ oneline contains=peridotInterpolatedWrapper
syntax region peridotInterpolatedWrapper start="\v#\{\s*" end="\v\s*\}" contained containedin=peridotString contains=peridotInterpolatedString
syntax match peridotInterpolatedString "\v\w+(#\{\})?" contained containedin=peridotInterpolatedWrapper

highlight default link peridotTodos Todo
highlight default link peridotComment Comment
highlight default link peridotNumber Number
highlight default link peridotKeywords Keyword
hi def link peridotBoolean Boolean
hi def link peridotTypes Type
highlight default link peridotString String
highlight default link peridotInterpolatedWrapper Delimiter
hi def link peridotNull Constant
hi def link peridotExceptions Exception
hi def link peridotBuiltins Function
