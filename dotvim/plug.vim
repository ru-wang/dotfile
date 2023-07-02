call plug#begin('~/.vim/plugged')

" colorschemes
Plug    'ayu-theme/ayu-vim'
Plug 'chriskempson/base16-vim'
Plug      'sainnhe/edge'
Plug     'nanotech/jellybeans.vim'
Plug        'sonph/onehalf', {'rtp' : 'vim'}
Plug   'logico-dev/typewriter'
Plug    'tomasiser/vim-code-dark'
Plug    'datMaffin/vim-colors-bionik'

" plugins
Plug      'junegunn/fzf',                           {'do'  : {-> fzf#install()}}
Plug      'junegunn/fzf.vim'
Plug      'junegunn/goyo.vim',                      {'on'  : 'Goyo'}
Plug     'preservim/nerdtree'
Plug     'godlygeek/tabular',                       {'on'  : 'Tabularize'}
Plug    'majutsushi/tagbar',                        {'on'  : ['Tagbar', 'TagbarToggle']}
Plug        'SirVer/ultisnips'
Plug   'vim-airline/vim-airline'
Plug   'vim-airline/vim-airline-themes'
Plug     'ryanoasis/vim-devicons'
Plug    'easymotion/vim-easymotion'


Plug 'vim-scripts/DirDiff.vim',           &diff ? {'on' : []} : {'on'     : 'DirDiff'}
Plug    'neoclide/coc.nvim',              &diff ? {'on' : []} : {'branch' : 'release'}
Plug 'AndrewRadev/linediff.vim',          &diff ? {'on' : []} : {'on'     : ['Linediff', 'LinediffReset']}
Plug      'lervag/vimtex',                &diff ? {'on' : []} : {'for'    : ['tex', 'plaintex', 'bib']}
Plug         'dag/vim-fish',              &diff ? {'on' : []} : {'for'    : 'fish'}
Plug    'airblade/vim-gitgutter',         &diff ? {'on' : []} : {'on'     : 'GitGutterToggle'}
Plug  'tikhomirov/vim-glsl',              &diff ? {'on' : []} : {'for'    : 'glsl'}
Plug  'plasticboy/vim-markdown',          &diff ? {'on' : []} : {'for'    : 'markdown'}

call plug#end()

colorscheme base16-horizon-dark

" colorscheme settings
let g:ayucolor               = 'dark'
let g:edge_style             = 'neon'
let g:gruvbox_contrast_dark  = 'hard'
let g:gruvbox_contrast_light = 'hard'

" plugin settings
let $FZF_DEFAULT_COMMAND      = 'rg --files'
let g:fzf_buffers_jump        = 1
let g:fzf_command_prefix      = 'Fzf'
let g:fzf_commits_log_options = '--color --graph --format:"%C(red)%h%Creset -%C(yellow)%d %C(bold green)%s %Cgreen(%cr) %C(bold blue)<%an>"'
let g:fzf_layout              = {'down' : '50%'}
let g:fzf_preview_window      = ['right:50%:hidden', 'ctrl-u']

let g:goyo_width  = '60%'
let g:goyo_height = '95%'
let g:goyo_linenr = 1

let g:NERDTreeAutoCenter          = 0
let g:NERDTreeCaseSensitiveSort   = 1
let g:NERDTreeDirArrowCollapsible = ' '
let g:NERDTreeDirArrowExpandable  = ' '
let g:NERDTreeWinPos              = 'left'
let g:NERDTreeWinSize             = 35

let g:tagbar_autofocus = 1
let g:tagbar_foldlevel = 3
let g:tagbar_iconchars = ['▸','▾']
let g:tagbar_left      = 0
let g:tagbar_silent    = 1
let g:tagbar_sort      = 0
let g:tagbar_width     = 35
let g:tagbar_zoomwidth = 0

let g:UltiSnipsExpandTrigger       = '<C-o>'
let g:UltiSnipsJumpForwardTrigger  = '<C-f>'
let g:UltiSnipsJumpBackwardTrigger = '<C-b>'
let g:UltiSnipsSnippetDirectories  = ['ultisnips']

let g:airline_left_alt_sep    = ''
let g:airline_left_sep        = ''
let g:airline_powerline_fonts = 1
let g:airline_right_alt_sep   = ''
let g:airline_right_sep       = ''
let g:airline_theme           = 'base16_horizon_dark'

let g:airline#extensions#tabline#enabled            = 1
let g:airline#extensions#tabline#show_buffers       = 0
let g:airline#extensions#tabline#show_close_button  = 0
let g:airline#extensions#tabline#show_splits        = 0
let g:airline#extensions#tabline#show_tab_count     = 0
let g:airline#extensions#tabline#show_tab_type      = 0
let g:airline#extensions#tabline#tabtitle_formatter = 'AirlineTabTitleFormatter'

let g:EasyMotion_smartcase = 1

if !&diff
  let g:DirDiffExcludes = ".*"

  let g:vimtex_mappings_enabled = 0
  let g:vimtex_quickfix_mode    = 0
  let g:vimtex_view_method      = 'zathura'

  let g:gitgutter_enabled              = 0
  let g:gitgutter_map_keys             = 0
  let g:gitgutter_preview_win_floating = 1

  let g:vim_markdown_folding_disabled        = 1
  let g:vim_markdown_frontmatter             = 1
  let g:vim_markdown_math                    = 1
  let g:vim_markdown_new_list_item_indent    = 2
  let g:vim_markdown_no_default_key_mappings = 0
  let g:vim_markdown_toc_autofit             = 1

  source ~/.vim/coc.vim
endif

nnoremap <M-c> :FzfColors<CR>
nnoremap <M-f> :FzfRg<CR>
nnoremap <M-g> :FzfGFiles?<CR>
nnoremap <M-b> :FzfBuffers<CR>
nnoremap <M-i> :FzfBCommits<CR>
nnoremap <M-l> :FzfBLines<CR>
nnoremap <M-n> :FzfFiles<CR>
nnoremap <M-o> :FzfBTags<CR>
nnoremap <M-h> :FzfHistory:<CR>
nnoremap <leader>f :FzfRg <C-r><C-w>
nnoremap <leader>dfm :Goyo<CR>
nnoremap <leader>tl :TagbarToggle<CR>

" Mirror the NERDTree before showing it. This makes it the same on all tabs.
nnoremap <leader>nf :NERDTreeMirror<CR>:NERDTreeFind<CR>
nnoremap <leader>nt :NERDTreeMirror<CR>:NERDTreeFocus<CR>

if !&diff
  nnoremap <leader>gg :GitGutterToggle<CR>
  nnoremap <leader>lc :LinediffReset<CR>
  vnoremap <leader>ld :Linediff<CR>
  nmap <M-e> <plug>(vimtex-errors)
  nmap <M-u> <plug>(GitGutterUndoHunk)
  nmap <M-p> <plug>(GitGutterPreviewHunk)
  nmap <M-s> <plug>(GitGutterStageHunk)
  nmap ]g <plug>(GitGutterNextHunk)
  nmap [g <plug>(GitGutterPrevHunk)
endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
au BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

au ColorScheme * highlight link GitGutterAdd          DiffAdd
au ColorScheme * highlight link GitGutterChange       DiffChange
au ColorScheme * highlight link GitGutterDelete       DiffDelete
au ColorScheme * highlight link GitGutterChangeDelete DiffText

au User GoyoEnter nested highlight EndOfBuffer guibg=bg guifg=bg
au User GoyoLeave nested highlight clear EndOfBuffer

function AirlineTabTitleFormatter(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let bufnr = buflist[winnr - 1]
  let winid = win_getid(winnr, a:n)
  let original_formatter = airline#extensions#tabline#formatters#default#format(bufnr, buflist)
  return original_formatter . g:WebDevIconsTabAirLineBeforeGlyphPadding . WebDevIconsGetFileTypeSymbol(bufname(bufnr))
endfunction
