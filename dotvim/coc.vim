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
nnoremap <silent> [d <plug>(coc-diagnostic-prev)
nnoremap <silent> ]d <plug>(coc-diagnostic-next)

" GoTo code navigation.
nnoremap <silent> <leader>jd <plug>(coc-definition)
nnoremap <silent> <leader>jy <plug>(coc-type-definition)
nnoremap <silent> <leader>ji <plug>(coc-implementation)
nnoremap <silent> <leader>jr <plug>(coc-references)

" Formatting selected code.
vnoremap <leader>f <plug>(coc-format-selected)
nnoremap <leader>f <plug>(coc-format)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <sid>show_documentation()<CR>

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nnoremap <leader>R <plug>(coc-rename)

" Apply AutoFix to problem on the current line.
nnoremap <leader>x <plug>(coc-fix-current)

nnoremap <leader>i :call CocActionAsync('organizeImport')<CR>
nnoremap <leader>o :CocCommand clangd.switchSourceHeader<CR>
nnoremap <leader>nt <Cmd>CocCommand explorer --no-focus<CR>
nnoremap <leader>nf <Cmd>CocCommand explorer --no-toggle<CR>

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
