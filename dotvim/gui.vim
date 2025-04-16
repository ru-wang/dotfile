" internal variables
let g:gfw_size_diff               = 2
let g:lsp_factor                  = 1.2
let g:preferred_dark_colorscheme  = 'codedark'
let g:preferred_light_colorscheme = 'ayu'

if has('gui_macvim')
  set guifont=FiraCode\ Nerd\ Font\ Mono Ret:h14
  set macligatures
  set macmeta
  set visualbell
  au InsertEnter * set noimdisable
  au InsertLeave * set imdisable
  au OSAppearanceChanged * call <SID>toggle_colorscheme()
else
  set guifont=FiraCode\ Nerd\ Font\ Mono\ 14
endif
set guioptions=ck

nnoremap <M--> :call <SID>smaller_fontsize()<CR>
nnoremap <M-=> :call <SID>larger_fontsize()<CR>

function! s:adjust_fontsize(amount)
  let re_font = '\v^((\S+\s*)+(\s+|:h))([1-9][0-9]*)$'

  let fontsize = substitute(&guifont, re_font, '\4', '') + a:amount
  if (&linespace > 0) && (g:lsp_factor > 1.0)
    let &linespace = string(ceil(fontsize * g:lsp_factor - fontsize))
  endif

  if (fontsize >= 6) && (fontsize <= 36)
    let fontname = substitute(&guifont, re_font, '\1', '')
    let &guifont = fontname .. fontsize
    if &guifontwide != ''
      let fontwide = substitute(&guifontwide, re_font, '\1', '')
      let &guifontwide = fontwide .. (fontsize - g:gfw_size_diff)
    endif
  endif
endfunction

function! s:larger_fontsize()
  silent call <SID>adjust_fontsize(1)
  redraw | let timer = timer_start(10, {-> execute("call <SID>show_font_name('󱨊')", "")})
endfunction

function! s:smaller_fontsize()
  silent call <SID>adjust_fontsize(-1)
  redraw | let timer = timer_start(10, {-> execute("call <SID>show_font_name('󱨉')", "")})
endfunction

function! s:show_font_name(triangle)
  echohl ModeMsg
  echo a:triangle .. '󰛖 ' .. &guifont .. ' ' .. &linespace .. '󰡏'
  echohl NONE
endfunction

function! s:toggle_colorscheme()
  if v:os_appearance == 0 || v:os_appearance == 2
    let g:ayucolor = 'light'
    set background=light
    execute 'colorscheme ' .. g:preferred_light_colorscheme
    doau ColorScheme g:preferred_light_colorscheme
  elseif v:os_appearance == 1 || v:os_appearance == 3
    let g:ayucolor = 'dark'
    set background=dark
    execute 'colorscheme ' .. g:preferred_dark_colorscheme
    doau ColorScheme g:preferred_dark_colorscheme
  endif
endfunction
