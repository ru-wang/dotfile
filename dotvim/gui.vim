" internal variables
let g:gfw_size_diff = 2
let g:lsp_factor    = 1.2

let g:WebDevIconsNerdTreeAfterGlyphPadding = ''

set guifont=FiraCode\ Nerd\ Font\ Mono\ 10
set guioptions=
set lsp=0
set nomousehide

nmap <M--> :call <SID>smaller_fontsize()<CR>
nmap <M-=> :call <SID>larger_fontsize()<CR>

if &diff
    colorscheme github
    let g:airline_theme = 'github'
endif

function s:adjust_fontsize(amount)
    let fontname = substitute(&guifont, '^\(.* \)\([1-9][0-9]*\)$', '\1', '')
    let cursize = substitute(&guifont, '^\(.* \)\([1-9][0-9]*\)$', '\2', '')
    let newsize = cursize + a:amount
    if (&linespace > 0) && (g:lsp_factor > 1.0)
        let &linespace = string(ceil(newsize * g:lsp_factor - newsize))
    endif
    if (newsize >= 6) && (newsize <= 36)
        let newfont = fontname . newsize
        let &guifont = newfont
        if !(&guifontwide == '')
            let fontwidename = substitute(&guifontwide, '^\(.* \)\([1-9][0-9]*\)$', '\1', '')
            let newfontwide = fontwidename . (newsize - g:gfw_size_diff)
            let &guifontwide = newfontwide
        endif
    endif
endfunction

function s:larger_fontsize()
    silent call <SID>adjust_fontsize(1)
    redraw
    echo &guifont . ':' . &linespace
endfunction

function s:smaller_fontsize()
    silent call <SID>adjust_fontsize(-1)
    redraw
    echo &guifont . ':' . &linespace
endfunction

call <SID>adjust_fontsize(0)
