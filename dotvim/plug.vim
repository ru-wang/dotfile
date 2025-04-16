call plug#begin('~/.vim/plugged')

" colorschemes
Plug 'ayu-theme/ayu-vim'
Plug 'catppuccin/nvim',                     {'as': 'catppuccin'}
Plug 'datMaffin/vim-colors-bionik'
Plug 'lifepillar/vim-solarized8'
Plug 'logico-dev/typewriter'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'sainnhe/edge'
Plug 'sonph/onehalf',                       {'rtp': 'vim'}
Plug 'tomasiser/vim-code-dark'

" plugins
Plug 'SirVer/ultisnips'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular',                   {'on': 'Tabularize'}
Plug 'junegunn/fzf',                        {'do': {-> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim',                   {'on': 'Goyo'}
Plug 'majutsushi/tagbar',                   {'on': ['Tagbar', 'TagbarToggle']}
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wellle/targets.vim'

" disable in diff mode
Plug 'AndrewRadev/linediff.vim', &diff ? {'on': []} : {'on': ['Linediff', 'LinediffReset']}
Plug 'airblade/vim-gitgutter',   &diff ? {'on': []} : {'on': 'GitGutterToggle'}
Plug 'dag/vim-fish',             &diff ? {'on': []} : {'for': 'fish'}
Plug 'lervag/vimtex',            &diff ? {'on': []} : {'for': ['tex', 'plaintex', 'bib']}
Plug 'neoclide/coc.nvim',        &diff ? {'on': []} : {'branch': 'release'}
Plug 'plasticboy/vim-markdown',  &diff ? {'on': []} : {'for': 'markdown'}
Plug 'tikhomirov/vim-glsl',      &diff ? {'on': []} : {'for': 'glsl'}
Plug 'vim-scripts/DirDiff.vim',  &diff ? {'on': []} : {'on': 'DirDiff'}

call plug#end()

colorscheme codedark

" colorscheme settings
let g:ayucolor             = 'dark'
let g:codedark_italics     = 1
let g:codedark_modern      = 1
let g:edge_style           = 'neon'
let g:solarized_visibility = 'low'

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

let g:tagbar_autofocus = 1
let g:tagbar_foldlevel = 3
let g:tagbar_iconchars = ['▸','▾']
let g:tagbar_left      = 1
let g:tagbar_silent    = 1
let g:tagbar_sort      = 0
let g:tagbar_width     = 35
let g:tagbar_zoomwidth = 0

let g:UltiSnipsExpandTrigger       = '<C-o>'
let g:UltiSnipsJumpForwardTrigger  = '<C-f>'
let g:UltiSnipsJumpBackwardTrigger = '<C-b>'
let g:UltiSnipsSnippetDirectories  = ['ultisnips']

let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled            = 1
let g:airline#extensions#tabline#show_buffers       = 0
let g:airline#extensions#tabline#show_close_button  = 0
let g:airline#extensions#tabline#show_splits        = 0
let g:airline#extensions#tabline#show_tab_count     = 0
let g:airline#extensions#tabline#show_tab_type      = 0
let g:airline#extensions#tabline#tabtitle_formatter = 'AirlineTabTitleFormatter'

let g:DevIconsAppendArtifactFix = 0
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
nnoremap <M-f> :FzfFiles %:p:h<CR>
nnoremap <M-g> :FzfGFiles?<CR>
nnoremap <M-b> :FzfBuffers<CR>
nnoremap <M-i> :FzfBCommits<CR>
nnoremap <M-l> :FzfBLines<CR>
nnoremap <M-n> :FzfFiles<CR>
nnoremap <M-o> :FzfBTags<CR>
nnoremap <M-h> :FzfHistory:<CR>
nnoremap <leader>F :FzfRg <C-r><C-w>
nnoremap <leader>dfm :Goyo<CR>
nnoremap <leader>tl :TagbarToggle<CR>

if !&diff
  nnoremap <leader>gg :GitGutterToggle<CR>
  nnoremap <leader>lc :LinediffReset<CR>
  vnoremap <leader>ld :Linediff<CR>
  nnoremap <M-u> <plug>(GitGutterUndoHunk)
  nnoremap <M-p> <plug>(GitGutterPreviewHunk)
  nnoremap <M-s> <plug>(GitGutterStageHunk)
  nnoremap ]g <plug>(GitGutterNextHunk)
  nnoremap [g <plug>(GitGutterPrevHunk)
endif

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
  return original_formatter 
        \ . g:WebDevIconsTabAirLineBeforeGlyphPadding 
        \ . WebDevIconsGetFileTypeSymbol(bufname(bufnr))
        \ . g:WebDevIconsTabAirLineAfterGlyphPadding
endfunction
