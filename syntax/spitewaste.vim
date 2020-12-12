" Vim syntax file
" Language:    Spitewaste (Whitespace assembly)
" Author:      Collided Scope
" Last Change: 20201212

if exists('b:current_syntax') | finish | endif

setlocal isi+=/,',+,-,?,!

syn match spwComment ';.*' contains=spwParams,spwTodo
syn match spwNumber '\<-\=\d\+\>'
syn match spwNumber "\<0[Xx]\x\+\>"
syn match spwNumber "\<0[Bb][01]\+\>"
syn match spwDefine '$\i\+'

syn region spwString start='"' end='"'
syn region spwString start="'" end="'"
syn region spwParams start='\[' end='\]'

syn keyword spwStack push pop dup swap copy slide
syn keyword spwFlow jump jz jn ret exit
syn keyword spwFunc map reduce select reject find times each
syn keyword spwNumber add sub mul div mod
syn keyword spwIO ichr inum ochr onum load store
syn keyword spwImport import
syn keyword spwCall call label
syn keyword spwTodo TODO XXX

syn match spwLabel '\i\+:'
syn match spwCall ':\i\+'

hi link spwCall Define
hi link spwComment Comment
hi link spwFlow Conditional
hi link spwFunc Special
hi link spwIO Type
hi link spwImport Include
hi link spwLabel Function
hi link spwParams SpecialComment
hi link spwNumber Number
hi link spwStack Identifier
hi link spwString String
hi link spwTodo Todo

" Highlight $ macros as bolded Number
exec 'hi spwDefine cterm=bold gui=bold' .
      \ ' guifg='   . synIDattr(synIDtrans(hlID('Number')), 'fg', 'gui') .
      \ ' ctermfg=' . synIDattr(synIDtrans(hlID('Number')), 'fg', 'cterm')

let b:current_syntax = 'spitewaste'
