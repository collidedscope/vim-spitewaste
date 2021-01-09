if exists('b:did_indent') | finish | endif
let b:did_indent = 1

setlocal indentexpr=GetSpwIndent() indentkeys+=<:>,{,}

function GetSpwIndent()
  let lnum = v:lnum

  if getline(lnum) =~ '\i\+:\|}$'
    return 0
  endif

  while lnum
    let lnum -= 1
    let line = getline(lnum)
    if line =~ '^\i\+:\|{$'
      return 2
    elseif line == ''
      return 0
    endif
  endwhile
endfunction
