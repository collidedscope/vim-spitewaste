" Vim syntax file
" Language:    Spitewaste (Whitespace assembly)
" Author:      Collided Scope
" Last Change: 20201212

if exists('b:current_syntax') | finish | endif

setlocal isi+=/,',`,+,-,?,!

syn match spwComment ';.*' contains=spwStackComment,spwTodo
syn match spwNumber '\<-\=\d\+\>'
syn match spwNumber "\<0[Xx]\x\+\>"
syn match spwNumber "\<0[Bb][01]\+\>"

syn match  spwMacro '$\i\+'
syn match  spwMacroStringify '#\i\+'
syn region spwMacroArg start='`' end='`'

syn region spwString start='"' end='"'
syn region spwString start="'" end="'"
syn region spwStackComment start='\[' end='\]'

syn keyword spwStack push pop dup swap copy slide
syn keyword spwFlow jump jz jn ret exit
syn keyword spwFunc map reduce select reject find times each minby maxby count all any none
syn keyword spwNumber add sub mul div mod
syn keyword spwIO ichr inum ochr onum load store
syn keyword spwImport import
syn keyword spwCall call label
syn keyword spwShell shell
syn keyword spwTodo TODO XXX

syn match spwLabel '\i\+:'
syn match spwCall ':\i\+'
syn match spwIO '[@^]-\=\d\+'

hi link spwCall Define
hi link spwComment Comment
hi link spwFlow Conditional
hi link spwFunc Special
hi link spwIO Type
hi link spwImport Include
hi link spwLabel Function
hi link spwMacroArg Special
hi link spwMacroStringify Special
hi link spwNumber Number
hi link spwStack Identifier
hi link spwString String
hi link spwTodo Todo

function! CribHighlighting(new, group, attrs)
  let l:id = synIDtrans(hlID(a:group))
  exec 'hi ' . a:new . ' cterm=' . a:attrs . ' gui=' . a:attrs .
        \ ' ctermfg=' . synIDattr(l:id, 'fg', 'cterm') .
        \ ' guifg='   . synIDattr(l:id, 'fg', 'gui')
endfunction

call CribHighlighting('spwMacro', 'Macro', 'bold')
call CribHighlighting('spwShell', 'spwIO', 'bold')
call CribHighlighting('spwStackComment', 'Comment', 'bold')

let b:current_syntax = 'spitewaste'
