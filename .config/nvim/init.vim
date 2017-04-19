set hidden
set nocompatible
set selection=inclusive

set splitbelow " Open new splits always below
set splitright " Open new splits always in the right side

syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

call plug#begin('~/.config/nvim/plugged')

" Color scheme
Plug 'nanotech/jellybeans.vim'

Plug 'fntlnz/atags.vim'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Provides mappings to easily delete, change and add such surroundings in pairs
Plug 'tpope/vim-surround'

" Expand selection easily
Plug 'terryma/vim-expand-region'

" Multiple cursors
Plug 'terryma/vim-multiple-cursors'

" Adds CoffeScript support
Plug 'kchmck/vim-coffee-script'

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

" Auto complete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-rct'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

" Typescript support for vim
Plug 'mhartington/nvim-typescript'

" Typescript syntax highlighting
Plug 'leafgarland/typescript-vim'

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

" Asynchronous Lint Engine
Plug 'w0rp/ale'

" Add plugins to &runtimepath
call plug#end()

let mapleader = " "

let g:ackprg = 'ag --vimgrep'

let g:vimfiler_as_default_explorer = 1

let g:CtrlSpaceSearchTiming = 500

let g:move_key_modifier = 'C'

let g:ctrlsf_position = 'bottom'
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

let $ZF_DEFAULT_COMMAND = 'ag --hidden --ignore tmp/ --ignore .git/ -g ""'

color jellybeans

" Bottom status bar scheme
let g:lightline = { 'colorscheme': 'jellybeans', 'component_function': { 'filename': 'LightLineFilename' } }

function! LightLineFilename()
  return expand('%')
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

" NERDTree
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
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

" vim-multiple-cursors

" Default highlighting (see help :highlight and help :highlight-link)
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual

" Other plugins need to be disabled to avoid conflicts while using the
"   multiple cursos plugin
function! Multiple_cursors_before()
  PasteEasyDisable
  let g:deoplete#disable_auto_complete = 1
endfunction

function! Multiple_cursors_after()
  PasteEasyEnable
  let g:deoplete#disable_auto_complete = 0
endfunction

map <Space> <Nop>
noremap <CR> <Nop>

" Menu
map ff :NERDTreeFind<CR>
map mt :NERDTreeToggle<CR>

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
noremap 00 :tablast<cr>

" Comment selected or current line
map <Leader>/ <Leader>c<Leader>i<ESC>

" Remove focus of last searched word
map \ :nohlsearch<CR>

" Close file
map <Leader>q <S-z><S-z>
map qq <S-z><S-z>

" Duplicate current line
map <Leader>d YP<ESC>

" Remove current line
map <Leader>x dd<ESC>

" Select the whole page
map <Leader>a :%y+<CR>

" Refresh current file
map <Leader>R :e!<CR>

" Replace
map <Leader>r :s///g
vnoremap <Leader>r y:s/<C-R>"//g<Left><Left>

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

let $FZF_DEFAULT_COMMAND = 'ag --skip-vcs-ignores --hidden --ignore .git --ignore tmp --ignore coverage -g ""'

" Deoplete.

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_debug = 1
let g:deoplete#enable_profile = 1

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
augroup end

" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1

  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

" Load the correct ruby compiler
autocmd FileType ruby compiler ruby

" Improve ruby auto complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" ALE
" Use standard if there is no .eslintrc file
if empty(findfile('.eslintrc', '.;'))
  let g:ale_linters = { 'javascript': ['flow', 'jscs', 'jshint', 'standard', 'xo'], 'typescript': ['tslint', 'tsserver', 'typecheck'] }
endif

" QFEnter (mimics the same keys to open errors in new windows or panes)
let g:qfenter_keymap = {}
let g:qfenter_keymap.open = ['<CR>']
let g:qfenter_keymap.vopen = ['s']
let g:qfenter_keymap.hopen = ['i']
let g:qfenter_keymap.topen = ['t']
