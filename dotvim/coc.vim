" Use <Tab> and <S-Tab> to navigate completion list:
" Insert <Tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <Tab> coc#pum#visible() ? coc#pum#next(1): "\<Tab>"
inoremap <silent><expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <C-Space> to trigger completion:
inoremap <silent><expr> <C-Space> coc#refresh()

" Use <CR> to confirm completion, use:
inoremap <expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" Use `[d` and `]d` to navigate diagnostics.
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [d <plug>(coc-diagnostic-prev)
nmap <silent> ]d <plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> <leader>jd <plug>(coc-definition)
nmap <silent> <leader>jy <plug>(coc-type-definition)
nmap <silent> <leader>ji <plug>(coc-implementation)
nmap <silent> <leader>jr <plug>(coc-references)

" Formatting selected code.
xmap <leader>f <plug>(coc-format-selected)
nmap <leader>f <plug>(coc-format-selected)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <sid>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>R <plug>(coc-rename)

" Formatting selected code.
xmap <leader>f <plug>(coc-format-selected)
nmap <leader>f <plug>(coc-format-selected)

" Apply AutoFix to problem on the current line.
nmap <leader>x <plug>(coc-fix-current)

nnoremap <leader>o :CocCommand clangd.switchSourceHeader<CR>

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
