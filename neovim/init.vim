call plug#begin('~/.vim/plugged')

" Notes
" ]q and [q to move after grepping

"======================================
" Standard Plugins
"======================================
Plug 'tpope/vim-surround'
Plug 'benekastah/neomake'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-fugitive'
"Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'chriskempson/base16-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'bling/vim-airline'
Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe'
Plug 'thinca/vim-textobj-function-javascript'
"Plug 'mileszs/ack.vim'
"Plug 'Shougo/deoplete.nvim'

Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-user'
Plug 'dag/vim-fish'
Plug 'elzr/vim-json'
"Plug 'Yggdroot/indentLine'
Plug 'majutsushi/tagbar'

"======================================
" Experimental
"======================================
Plug 'mhinz/vim-grepper'
Plug 'kassio/neoterm'
"Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-unimpaired'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dbakker/vim-paragraph-motion'
Plug 'simnalamburt/vim-mundo'

"======================================
" JavaScript Plugins
"======================================
Plug 'jelera/vim-javascript-syntax'
"Plug 'othree/yajs.vim'
" Plug 'ternjs/tern_for_vim'

"======================================
" Elm Plugins
"======================================
Plug 'lambdatoast/elm.vim'

"======================================
" Text Objects
"======================================
Plug 'vim-scripts/argtextobj.vim'
Plug 'michaeljsmith/vim-indent-object'

" Add plugins to &runtimepath
call plug#end()

"======================================
" Color Scheme Stuff
"======================================
colorscheme base16-default
let base16colorspace=256
set background=light
syntax enable

"======================================
" Remap Leader from \ to ,
"======================================
let localleader=','
let maplocalleader=','        " all my macros start with ,
let mapleader=','
nnoremap <C-E> ,

"======================================
" Options
"======================================
set modeline
set modelines=5
set ruler                     " show the line number on the bar
set more                      " use more prompt
set autoread                  " watch for file changes
set number                    " line numbers
set hidden
set noautowrite               " don't automagically write on :next
set showmode
set showcmd
set cindent
set smarttab                  " tab and backspace are smart
set tabstop=4                 " tabs=4 spaces for python
set shiftwidth=4
set expandtab
set wrap
set textwidth=80
set textwidth=80
set formatoptions=qrn1
set scrolloff=5               " keep at least 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set history=200
set backspace=indent,eol,start
set linebreak
set cmdheight=2               " command line two lines high
set undolevels=1000           " 1000 undos
set updatecount=100           " switch every 100 chars
set complete=.,w,b,t          " Only use quick scanning techniques
set mouse=a
set noerrorbells              " No error bells please
set shell=bash
set fileformats=unix
set ff=unix
set wildignore=*.o,*.obj,*.bak,*.exe
set wildmode=longest:full
set wildmenu                  " menu has tab completion
set laststatus=2
set cc=100
set ttyfast
set incsearch                 " incremental search
set ignorecase                " search ignoring case
set hlsearch                  " highlight the search
" set showmatch                 " show matching bracket
set diffopt=filler,iwhite     " ignore all whitespace and sync
set cursorline
set smartindent    " auto/smart indent

"======================================
" Neomake
"======================================
autocmd! BufWritePost * Neomake  " Run neomake on saves
"autocmd InsertChange,TextChanged * update | Neomake
"let g:neomake_javascript_enabled_makers = ['eslint_d']
let g:neomake_javascript_enabled_makers = ['eslint_d']

" Use local eslint if available
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
    let local_eslint = getcwd() . "/" . local_eslint
endif

let eslintexec = executable(local_eslint) ? local_eslint : 'eslint'

let g:neomake_javascript_eslint_maker = {
    \ 'exe': eslintexec,
    \ 'args': ['-f', 'compact'],
    \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
    \ '%W%f: line %l\, col %c\, Warning - %m'
    \ }

"======================================
" Elm Make
"======================================
autocmd! BufWritePost *.elm ElmMakeCurrentFile

"======================================
" Ultisnips
"======================================
let g:UltiSnipsExpandTrigger="<C-b>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"Split window vertical"
let g:UltiSnipsEditSplit="vertical"

"======================================
" Backup
"======================================
set noswapfile
set backupskip=/tmp/*,/private/tmp/*
set backup
set undodir=~/.config/nvim/tmp/undo//     " undo files
set backupdir=~/.config/nvim/tmp/backup// " backups
set directory=~/.config/nvim/tmp/swap//   " swap files
silent !mkdir ~/.config/nvim/tmp > /dev/null 2>&1
silent !mkdir ~/.config/nvim/tmp/undo > /dev/null 2>&1
silent !mkdir ~/.config/nvim/tmp/backup > /dev/null 2>&1
silent !mkdir ~/.config/nvim/tmp/swap > /dev/null 2>&1

"======================================
" Spelling
"======================================
if v:version >= 700
    " Enable spell check for text files
    autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en
endif


"======================================
" Navigation
"======================================

" hjkl shift/ctrl modifiers
"nnoremap <C-Y> <S-J>
"vnoremap <C-Y> <S-J>

"nnoremap <S-J> 4gj
"nnoremap <S-K> 4gk

"nnoremap <C-J> 14gj
"nnoremap <C-K> 14gk

"vnoremap <S-J> 4gj
"nnoremap <S-K> 4gk

"vnoremap <C-J> 14gj
"vnoremap <C-K> 14gk


"map <C-M> to match parentheses
nnoremap <C-M> %
vnoremap <C-M> %

" keep searches in the middle window
nnoremap n nzzzv
nnoremap N Nzzzv

" Do not move on *
nnoremap * *<c-o>

"clear search
nnoremap ,, :nohls<cr>

"File Format
"Windows
command Dos :e ++ff=dos
command Mac :e ++ff=mac
command Unix :e ++ff=unix

" File Navigation
nmap ,v :vsplit<cr>
nmap ,h :split<cr>
nmap ,t :tabedit<cr>

" Select entire buffer
nnoremap vaa ggvGg_
nnoremap Vaa ggVG"

"Visual reselection
nnoremap <leader>V V`]

"Visually select current line excluding indentation
nnoremap vv ^vg_

"======================================
" Quick Editing
"======================================
nnoremap ,ev :e $MYVIMRC<cr>
nnoremap ,et :e ~/.tmux.conf<cr>
nnoremap ,ez :e ~/.zshrc<cr>
nnoremap ,ef :e ~/.config/fish/config.fish<cr>

" RaaSCAL project
nnoremap ,ers :e ~/Citrix/raascal/src<cr>
nnoremap ,erf :e ~/Citrix/raascal/fixture<cr>
nnoremap ,erh :e ~/Citrix/raascal<cr>
nnoremap ,erg :e ~/Citrix/raascal/Gruntfile.js<cr>

" Edit Snippets
nnoremap ,escp :e  ~/.vim/plugged/vim-snippets/snippets/cpp.snippets<cr>
nnoremap ,esj :e  ~/.vim/plugged/vim-snippets/snippets/javascript<cr>

" Toggle paste mode
nmap <silent> ,p :set invpaste<CR>:set paste?<CR>

"======================================
" Grepper
"======================================
nnoremap <leader>gg :Grepper<cr>

"======================================
" Tmuxline
"======================================
let g:tmuxline_preset = {
      \ 'a'    : '#S',
      \ 'win'  : ['#I', '#W'],
      \ 'cwin' : ['#I', '#W', '#F'],
      \ 'y'    : ['%R', '%a', '%Y'],
      \ 'z'    : '#H'}
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '',
    \ 'right' : '',
    \ 'right_alt' : '',
    \ 'space' : ' '}
"======================================
" CtrlP
"======================================
let g:ctrlp_switch_buffer = 'E'
let g:ctrlp_tabpage_position = 'c'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_root_markers = ['.project.root']
let g:ctrlp_user_command =
    \ 'ag %s --files-with-matches -g "" --ignore "\.git$\|\.hg$\|\.svn$" --ignore-dir "node_modules"'
"let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
"let g:ctrlp_custom_ignore = '\v[\/]\.(DS_Storegit|hg|svn|optimized|compiled|node_modules)$'
"
"let g:ctrlp_custom_ignore = '\v'
"let g:ctrlp_custom_ignore .= '%(/\.'
"let g:ctrlp_custom_ignore .= '%(git|hg|svn)|'
"let g:ctrlp_custom_ignore .= '\.%(class|o|png|jpg|jpeg|bmp|tar|jar|tgz|deb|zip|)$|'
"let g:ctrlp_custom_ignore .= '/target/%(quickfix|resolution-cache|streams)|'
"let g:ctrlp_custom_ignore .= '/target/scala-2.1./%(classes|test-classes|sbt-0.13|cache)|'
"let g:ctrlp_custom_ignore .= '/project/target|/project/project|node_modules|DS_STORE|git|dist*|rtcgw-js|tools|build|coverage'
"let g:ctrlp_custom_ignore .= ')'
"let g:ctrlp_open_new_file = 'r'
let g:ctrlp_open_multiple_files = '1ri'
let g:ctrlp_match_window = 'max:40'
let g:ctrlp_prompt_mappings = {
  \ 'PrtSelectMove("j")':   ['<c-n>'],
  \ 'PrtSelectMove("k")':   ['<c-p>'],
  \ 'PrtHistory(-1)':       ['<c-j>', '<down>'],
  \ 'PrtHistory(1)':        ['<c-i>', '<up>']
\ }
nmap ,fb :CtrlPBuffer<cr>
nmap ,ff :CtrlP ../<cr>
nmap ,fF :execute ":CtrlP " . expand('%:p:h')<cr>
nmap ,fr :CtrlP<cr>
nmap ,fm :CtrlPMixed<cr>
nmap ,fc :CtrlPClearCache<cr>
nmap ,fa :CtrlPClearAllCaches<cr>
" autocmd BufWritePost :CtrlPClearAllCaches<cr> TODO: Clear cache on write

"======================================
" Common spelling mistakes
"======================================
iab Acheive    Achieve
iab acheive    achieve
iab Alos       Also
iab alos       also
iab Aslo       Also
iab aslo       also
iab Becuase    Because
iab becuase    because
iab Bianries   Binaries
iab bianries   binaries
iab Bianry     Binary
iab bianry     binary
iab Charcter   Character
iab charcter   character
iab Charcters  Characters
iab charcters  characters
iab Exmaple    Example
iab exmaple    example
iab Exmaples   Examples
iab exmaples   examples
iab Fone       Phone
iab fone       phone
iab Lifecycle  Life-cycle
iab lifecycle  life-cycle
iab Lifecycles Life-cycles
iab lifecycles life-cycles
iab Seperate   Separate
iab seperate   separate
iab Seureth    Suereth
iab seureth    suereth
iab Shoudl     Should
iab shoudl     should
iab Taht       That
iab taht       that
iab Teh        The
iab teh        the
iab functoin   function
iab functin    function
iab functon    function
iab fnction    function
iab clss       class

nnoremap <silent> <F2> :lnext<cr>
nnoremap <silent> <F1> :lprev<cr>

" DelimitMate
let delimitMate_expand_cr = 1 " Insert newline after '{' + '\n'

" Nerd Tree
nnoremap <silent> ,nt :NERDTreeToggle<cr>
nnoremap <silent> ,nf :NERDTreeFind<cr>
nnoremap <silent> ,nw :NERDTreeCWD<cr>
nnoremap <silent> ,nc :NERDTreeClose<cr>

" Gundo
nnoremap <silent> ,gt :GundoToggle<cr>


" Open nerd tree automatically
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


"Source files with leader S
vnoremap ,S y:execute @@<cr>:echo 'Sourced selection.'<cr>
nnoremap ,S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>

"converts the current word in insert mode to uppercase
inoremap <C-k> <esc>mzgUiw`za

" Redraw my Screen
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

"Clean trailing whitespace
nnoremap ,kk mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Fold QuickFix window
" Folding of (gnu)make output.
au BufReadPost quickfix setlocal foldmethod=marker
au BufReadPost quickfix setlocal foldmarker=Entering\ directory,Leaving\ directory
au BufReadPost quickfix map <buffer> <silent> zq zM:g/error:/normal zv<CR>
au BufReadPost quickfix map <buffer> <silent> zw zq:g/warning:/normal zv<CR>
au BufReadPost quickfix normal zq

" Strip unwanted whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Open tag bar
noremap <Leader>b :TagbarToggle<cr>

" Toggle line numbers
nnoremap <Leader>l :set invnumber<cr>

" Indent line settings (disabled because it was making vim slow
"let g:indentLine_char = '┊'
"let g:indentLine_leadingSpaceEnabled = 1
"let g:indentLine_leadingSpaceChar = '·'
"let g:indentLine_maxLines = 3000
"
nnoremap <C-h> ^
nnoremap <C-l> $

vnoremap <C-h> ^
vnoremap <C-l> $

nnoremap ( {k
nnoremap ) }j

vnoremap ( {k
vnoremap ) }j

" use deoplete
let g:deoplete#enable_at_startup = 1
