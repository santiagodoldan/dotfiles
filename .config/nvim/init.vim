set hidden
set nocompatible
set selection=inclusive
set background=light
set mouse=a
set encoding=UTF-8
set guifont=Hack\ Nerd\ Font:h12

set splitbelow " Open new splits always below
set splitright " Open new splits always in the right side

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

function! InitializeCoc()
  call coc#util#install()
  call coc#util#install_extensions([
  \ 'coc-ultisnips',
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-html',
  \ 'coc-css',
  \ 'coc-yaml',
  \ 'coc-highlight',
  \ 'coc-angular'
  \ ])
  call coc#config('coc.preferences', {
  \ 'diagnostic.displayByAle': 1,
  \ 'diagnostic.triggerSignatureHelp': 0,
  \ })
endfunction

let g:ale_disable_lsp = 1

call plug#begin('~/.config/nvim/plugged')

" Color scheme
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" Confirm before closing VIM session
Plug 'vim-scripts/confirm-quit'

" Vim plugin that displays tags in a window, ordered by scope
Plug 'majutsushi/tagbar'

Plug 'fntlnz/atags.vim'

" Run your tests at the speed of thought
Plug 'janko-m/vim-test'

" A Vim plugin which shows a git diff in the gutter (sign column) and stages/undoes hunks.
Plug 'airblade/vim-gitgutter'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Provides mappings to easily delete, change and add such surroundings in pairs
Plug 'tpope/vim-surround'

" Expand selection easily
Plug 'terryma/vim-expand-region'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Adds slim support
Plug 'slim-template/vim-slim'

" Rails plugins
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'

" Ruby syntax highlight + compiler + autocompletion
Plug 'vim-ruby/vim-ruby'

" Bottom status/tabline
Plug 'itchyny/lightline.vim'

" Move lines up/down with a shortcut
Plug 'matze/vim-move'

" Open a Quickfix item in a window you choose. (Vim plugin)
Plug 'yssl/QFEnter'

" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Vim plugin that adds icons for nerdtree. Install https://github.com/ryanoasis/nerd-fonts and choose 'Hack Nerd Font'
Plug 'ryanoasis/vim-devicons'

" Typescript syntax highlighting
Plug 'leafgarland/typescript-vim'

" Auto complete
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Save automatically
Plug 'vim-scripts/vim-auto-save'

" Comment a line or a block easily
Plug 'scrooloose/nerdcommenter'

" Search and Replace multiple files at once
Plug 'dyng/ctrlsf.vim'

" Changes to set paste or set nopaste automatically
Plug 'roxma/vim-paste-easy'

Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'ntpeters/vim-better-whitespace'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Add plugins to &runtimepath
call plug#end()

let mapleader = " "

let g:ackprg = 'ag --vimgrep'

let g:vimfiler_as_default_explorer = 1

let g:CtrlSpaceSearchTiming = 500

let g:move_key_modifier = 'C'

" Sessions storage directory
let g:workspace_session_directory = '/Users/santiagodoldan/.config/nvim/sessions/'

let g:ctrlsf_position = 'bottom'
let g:ctrlsf_ignore_dir = ['log', 'tmp']
let g:ctrlsf_auto_close = 0
let g:ctrlsf_mapping = {
  \ 'prev': '<C-K>',
  \ 'next': '<C-J>',
  \ 'split': '<C-i>',
  \ 'vsplit': '<C-s>',
  \ 'open': ['<CR>', 'o'],
  \ 'tab': '<C-t>',
  \ 'popenf': '<C-p>',
  \ 'openb': 'O',
  \ 'quit': 'q',
  \ 'pquit': 'q',
  \ 'tabb': '',
  \ 'loclist': '',
  \ 'popen': '' }

let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
let g:auto_save_silent = 1  " do not display the auto-save notification

set termguicolors

let ayucolor="light"

" colorscheme ayu
" colorscheme jellybeans
colorscheme onehalfdark

" Bottom status bar scheme
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
      \ }
      \ }

function! LightLineFilename()
  return expand('%:p:h')
endfunction

" Cursor styling (:help guicursor)
:set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

" Ruby 2 spaces
set shiftwidth=2
set softtabstop=2
set tabstop=2
set autoindent

" Folding settings
set foldmethod=indent
set nofoldenable
set foldlevel=1

set history=1000
set laststatus=2
set cursorline
set modelines=0
set clipboard=unnamed
set synmaxcol=328
set nowrap
set number
set expandtab
set nowritebackup
set noswapfile
set nobackup
set hlsearch
set ignorecase
set smartcase
set completeopt-=preview " Do not show preview code nvim-typescript
set omnifunc=syntaxcomplete#Complete
set grepprg=ag\ --nogroup\ --nocolor

" Set terminal tab name
let &titlestring = ':: ' . expand('%:p:h:t') . ' ::'

set title

" NERDTree
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 0
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeIgnore = []
let NERDTreeStatusline = ''
let NERDSpaceDelims=1
" To let reverse vim search with ?
let NERDTreeMapHelp='<f1>'

" Close menu if is the last open buffer in the window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Show trailling spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Default highlighting (see help :highlight and help :highlight-link)
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual

" Other plugins need to be disabled to avoid conflicts while using the
   "multiple cursor plugin
function! Multiple_cursors_before()
  PasteEasyDisable
  CocDisable
endfunction

function! Multiple_cursors_after()
  PasteEasyEnable
  CocEnable
endfunction

nmap <silent> <Leader>n <Plug>(VM-Find-Under)
nmap <silent> <Leader>j <Plug>(VM-Add-Cursor-Down)
nmap <silent> <Leader>k <Plug>(VM-Add-Cursor-Up)

map <Space> <Nop>
noremap <CR> <Nop>

" Menu
map ff :NERDTreeFind<CR>
map mt :NERDTreeToggle<CR>

" coc.nvim configs

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <expr><TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Go to definition
map <Leader>g :call CocAction('jumpDefinition', 'vsplit')<CR>

" EasyAlign
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

map <Leader>w <C-w>
map <Leader>s :w<CR>

" Search
map <Leader>f :CtrlSF 
map <Leader>F :CtrlSFOpen<CR>
vnoremap <Leader>f y<CR>:CtrlSF <C-R>"<CR>

vnoremap // y/<C-R>"<CR>

nnoremap <Leader>y :History<CR>
nnoremap <Leader>o :FZF<CR>

" Switch panes
map <Leader>h <C-W><C-H>
map <Leader>l <C-W><C-L>
map <Leader>k <C-W><C-K>
map <Leader>j <C-W><C-J>

map <Leader>H <C-W>H
map <Leader>L <C-W>L
map <Leader>J <C-W>J
map <Leader>K <C-W>K

map <Leader>I <C-W>s
map <Leader>S <C-W>v

" Tabs
map <TAB> ><Right>
map <S-TAB> <<Right>

vmap <TAB> >gv
vmap <S-TAB> <gv
map <Leader>t :tabnew<CR>
map tt :tabnew<CR>
map ta :tabonly<CR>

map >> :execute "tabmove" tabpagenr() +1<CR>
map << :execute "tabmove" tabpagenr() -2<CR>

map .. gt<ESC>
map ,, gT<ESC>

" Go to tab by number
noremap 11 1gt
noremap 22 2gt
noremap 33 3gt
noremap 44 4gt
noremap 55 5gt
noremap 66 6gt
noremap 77 7gt
noremap 88 8gt
noremap 99 9gt

" Comment selected or current line
map <Leader>/ <Leader>c<Leader>i<ESC>

" Remove focus of last searched word
map \ :nohlsearch<CR>

" Close file
map <Leader>q <S-z><S-z>
map qq <S-z><S-z>
map <S-q> :qa!<CR>

" Duplicate current line
map <Leader>d yyP<ESC>

" Remove current line
map <Leader>x dd<ESC>

" Select the whole page
map <Leader>a :%y+<CR>

" Refresh current file
map <Leader>R :e!<CR>

" Replace
map <Leader>r :%s///gc
vnoremap <Leader>r y:%s/<C-R>"//gc<Left><Left><Left>

" Add quotes to a selected word or phrase
vmap ' S'
vmap " S"

" Enter Visual mode
nmap <Leader><Leader> V

" Autocomplete
:set dictionary="/usr/dict/words"

" Autoreload files when changed externally
set autoread

" FZF
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-s': 'vsplit' }

let $FZF_DEFAULT_COMMAND = 'ag --hidden --path-to-ignore /Users/santiagodoldan/.ignore -g ""'

autocmd BufWritePost *.scala silent :EnTypeCheck

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
  autocmd FileType java setlocal omnifunc=javacomplete#Complete
augroup end

" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1

  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

" Load the correct ruby compiler
autocmd FileType ruby compiler ruby

" Improve ruby auto complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Coc
augroup vimrc_coc
  autocmd!
  autocmd VimEnter * call s:setup_coc()
augroup END

function s:setup_coc() abort
  call coc#config('coc.preferences', {
        \ 'diagnostic.displayByAle': 1,
        \ 'diagnostic.triggerSignatureHelp': 0,
        \ })
endfunction

" ALE
let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'javascript': ['eslint'],
\   'vue': ['eslint']
\}

let g:ale_fixers = {
  \    'javascript': ['eslint'],
  \    'typescript': ['prettier', 'tslint'],
  \    'vue': ['eslint'],
  \    'scss': ['prettier'],
  \    'html': ['prettier'],
  \    'reason': ['refmt']
\}

" File type detection
autocmd BufNewFile,BufRead *.es6 set filetype=javascript
autocmd BufNewFile,BufRead *.tsx set filetype=typescript
autocmd BufNewFile,BufRead *.jst.ejs.* set filetype=html
autocmd FileType *.js* set noballooneval

" QFEnter (mimics the same keys to open errors in new windows or panes)
let g:qfenter_keymap = {}
let g:qfenter_keymap.open = ['<CR>']
let g:qfenter_keymap.vopen = ['s']
let g:qfenter_keymap.hopen = ['i']
let g:qfenter_keymap.topen = ['t']

let g:NERDTreeWinPos = "left"
