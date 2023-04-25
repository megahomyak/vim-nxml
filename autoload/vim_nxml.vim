function! vim_nxml#Indent(lnum)
    let prevlinenum = prevnonblank(a:lnum-1)
    let indent = 0
    if prevlinenum > 0
        let indent = indent(prevlinenum)
        let prevline = getline(prevlinenum)
        if strridx(prevline, "[") > strridx(prevline, "]")
            let indent += &shiftwidth
        endif
    endif
    let curline = getline(a:lnum)
    if (
    \ (stridx(curline, "]") != -1)
    \     && (stridx(curline, "[") != -1)
    \     && (stridx(curline, "]") < stridx(curline, "["))
    \ ) || (
    \     (stridx(curline, "[") == -1)
    \     && (stridx(curline, "]") != -1)
    \ )
        if indent != 0
            let indent -= &shiftwidth
        endif
    endif
    return indent
endfunction
