if exists("b:did_indent")
  finish
endif

let b:did_indent = 1

setlocal nolisp
setlocal autoindent
setlocal indentexpr=PeridotIndent(v:lnum)
setlocal indentkeys+=<:>,0=},0=)

if exists("*PeridotIndent")
  finish
endif

function! PeridotIndent(lnum) abort
endfunction
