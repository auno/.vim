setlocal shiftwidth=2
setlocal tabstop=2

function s:MarkdownHeadingFoldExpr()
  let line = getline(v:lnum)
  
  if line[0] != '#'
    return '='
  endif

  let headingLevel = match(line, "[^#]")

  if headingLevel > &foldnestmax
    return '='
  endif

  return '>'.headingLevel
endfunction

setlocal foldexpr=s:MarkdownHeadingFoldExpr()
