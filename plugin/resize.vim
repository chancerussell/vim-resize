" resize.vim    resizing the screen
" Author:       Breuckelen (Benjamin Attal)
" Version:      1.0


"Is<direction>Most Boolean Functions ---------------------- {{{
function! IsRightMost()
    let oldw = winnr()
    silent! exec "normal! \<c-w>l"  
    let neww = winnr()
    silent! exec oldw.'wincmd w'
    return oldw == neww
endfunction

function! IsBottomMost()
    let oldw = winnr()
    silent! exec "normal! \<c-w>j"  
    let neww = winnr()
    silent! exec oldw.'wincmd w'
    return oldw == neww
endfunction

function! IsTopMost()
    let oldw = winnr()
    silent! exec "normal! \<c-w>k"  
    let neww = winnr()
    silent! exec oldw.'wincmd w'
    return oldw == neww
endfunction

function! IsLeftMost()
    let oldw = winnr()
    silent! exec "normal! \<c-w>h"  
    let neww = winnr()
    silent! exec oldw.'wincmd w'
    return oldw == neww
endfunction
" }}}

"Resize<direction> function ---------------------- {{{
function! ResizeUp()
    if IsBottomMost()
        if IsTopMost()
            silent! exec "normal \<c-w>-"
        else
            silent! exec "normal \<c-w>+"
        endif
    else
        silent! exec "normal \<c-w>-"
    endif
endfunction

function! ResizeDown()
    if IsBottomMost()
        if IsTopMost()
            silent! exec "normal \<c-w>+"
        else
            silent! exec "normal \<c-w>-"
        endif
    else
        silent! exec "normal \<c-w>+"
    endif
endfunction

function! ResizeLeft()
    if IsRightMost()
        if !IsLeftMost()
            silent! exec "normal \<c-w>>"
        endif
    else
        silent! exec "normal \<c-w><"
    endif
endfunction

function! ResizeRight()
    if IsRightMost()
        if !IsLeftMost()
            silent! exec "normal \<c-w><"
        endif
    else
        silent! exec "normal \<c-w>>"
    endif
endfunction
" }}}

"Resize<direction>(increment) functions ----------- {{{
function! ResizeUpN(n)
    for i in range(1,a:n)
        call ResizeUp()
    endfor
endfunction

function! ResizeDownN(n)
    for i in range(1,a:n)
        call ResizeDown()
    endfor
endfunction

function! ResizeLeftN(n)
    for i in range(1,a:n)
        call ResizeLeft()
    endfor
endfunction

function! ResizeRightN(n)
    for i in range(1,a:n)
        call ResizeRight()
    endfor
endfunction
" }}}
