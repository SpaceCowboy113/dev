" Source: https://github.com/SpaceCowboy113/vimrc/blob/master/.vimrc
"
" Preamble {{{
syntax on
set nocompatible
" }}}

" Vundle (Plugin Management){{{
" Help {{{ 
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" }}}

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" My Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'godlygeek/csapprox'
Plugin 'kien/ctrlp.vim'
Plugin 'derekwyatt/vim-scala'
"Plugin 'Rip-Rip/clang_complete' "Bugging out currently
Plugin 'goldfeld/vim-seek'


" Color schemes
Plugin 'sjl/badwolf'
Plugin 'tomasr/molokai'
Plugin 'quanganhdo/grb256'
Plugin 'altercation/vim-colors-solarized'
Plugin 'w0ng/vim-hybrid'
Plugin 'nanotech/jellybeans.vim'

call vundle#end()
filetype plugin indent on
" }}}

" Windows {{{
set showbreak=¬
" }}}

" Linux {{{

"set showbreak=↪

" }}}

" Colors {{{

set t_Co=256
set t_AB=^[[48;5;%dm
set t_AF=^[[38;5;%dm]]]]
if !has("gui_running")
    set term=screen-256color
endif
syntax enable
set background=dark
colorscheme badwolf

" }}}

" Gui {{{
if has("gui_running")
    "set guifont=Consolas:h11:cDefault
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    au GUIEnter * simalt ~x
    highlight Pmenu guibg=brown gui=bold
endif

" }}}

" Options {{{
let localleader=','
let maplocalleader=','        " all my macros start with ,
set encoding=utf-8
set modeline
set modelines=5
set visualbell
set ruler                     " show the line number on the bar
set more                      " use more prompt
set autoread                  " watch for file changes
set number                    " line numbers
set hidden
set noautowrite               " don't automagically write on :next
set lazyredraw                " don't redraw when don't have to
set showmode
set showcmd
set autoindent 
set smartindent    " auto/smart indent
set smarttab                  " tab and backspace are smart
set tabstop=4                 " tabs=4 spaces for python
set shiftwidth=4
set wrap
set textwidth=80
set textwidth=80
set formatoptions=qrn1
set expandtab
set scrolloff=5               " keep at least 5 lines above/below
set sidescrolloff=5           " keep at least 5 lines left/right
set history=200
set backspace=indent,eol,start
set linebreak
set cmdheight=2               " command line two lines high
set undolevels=1000           " 1000 undos
set updatecount=100           " switch every 100 chars
set complete=.,w,b,t          " Only use quick scanning techniques
set ttyfast                   " we have a fast terminal
"set mouse=a
set noerrorbells              " No error bells please
set shell=bash
set fileformats=unix
set ff=unix
set wildignore=*.o,*.obj,*.bak,*.exe
set wildmode=longest:full
set wildmenu                  " menu has tab completion
set laststatus=2
set relativenumber
set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo
" }}}

" Plugin Settings {{{
" Ultisnips {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"Split window vertical"
let g:UltiSnipsEditSplit="vertical"
" }}}
" vim-cpp-enhanced-highlight {{{
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
" }}}
" Yankring {{{
nnoremap <silent> <F6> :YRShow<cr>
" }}}
" Nerd tree {{{
nnoremap <silent> <F2> :NERDTree<cr>
" }}}
" }}}

" Tags {{{
set tags+=~/tags
set tags+=~/.vim/tags/cpp
"Build tags for own project
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" }}}

"  searching {{{
set incsearch                 " incremental search
set ignorecase                " search ignoring case
set hlsearch                  " highlight the search
set showmatch                 " show matching bracket
set diffopt=filler,iwhite     " ignore all whitespace and sync
set cursorline

" keep searches in the middle window
nnoremap n nzzzv
nnoremap N Nzzzv

" Do not move on *
nnoremap * *<c-o>

" Use sane regexes
"nnoremap / /\v
"vnoremap / /\v
"clear search
nnoremap ,, :noh<cr>call clearmatches()<cr>
" }}}

"  Folding --------------------------------------------------- {{{
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
"set nofoldenable        "dont fold by default
"set foldlevel=1         "this is just what i use
set foldenable
set foldlevelstart=10
" Make zO recursively open whatever fold we're in, even if it's partially open.
nnoremap zO zczO
" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

"Fold everything but focus
nnoremap ,z zMzvzz

" "Focus" the current line.  Basically:
"
" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a little bit (15 lines) above the center of the screen.
"
" This mapping wipes out the z mark, which I never use.
"
" I use :sus for the rare times I want to actually background Vim.
"nnoremap <c-z> mzzMzvzz15<c-e>`z:Pulse<cr>

"function! MyFoldText() " {{{
    "let line = getline(v:foldstart)

    "let nucolwidth = &fdc + &number * &numberwidth
    "let windowwidth = winwidth(0) - nucolwidth - 3
    "let foldedlinecount = v:foldend - v:foldstart

    "" expand tabs into spaces
    "let onetab = strpart('          ', 0, &tabstop)
    "let line = substitute(line, '\t', onetab, 'g')

    "let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    "let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    "return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
"endfunction " }}}
"set foldtext=MyFoldText()
" }}}

" Backup --------------------------------------------------------- {{{
set noswapfile
set backupskip=/tmp/*,/private/tmp/*
set backup
set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
silent !mkdir ~/.vim/tmp > /dev/null 2>&1
silent !mkdir ~/.vim/tmp/undo > /dev/null 2>&1
silent !mkdir ~/.vim/tmp/backup > /dev/null 2>&1
silent !mkdir ~/.vim/tmp/swap > /dev/null 2>&1
" }}}

" spelling {{{
if v:version >= 700
    " Enable spell check for text files
    autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en
endif
" }}}

" Navigation {{{{

" hjkl shift/ctrl modifiers
nnoremap <S-J> 4gj
nnoremap <S-K> 4gk

vnoremap <S-J> 4gj
vnoremap <S-K> 4gk

nnoremap <C-H> 0
nnoremap <C-J> 14gj
nnoremap <C-K> 14gk
nnoremap <C-L> $

vnoremap <C-H> 0
vnoremap <C-J> 14gj
vnoremap <C-K> 14gk
vnoremap <C-L> $

" Go to beginning or end of line in insert mode
inoremap <c-z> <esc>I
inoremap <c-a> <esc>A

"map tab to match parentheses
"nnoremap ; :
"nnoremap : '
"nnoremap ' ;
"nnoremap \ \
nnoremap <C-M> %
vnoremap <C-M> %

"imap jk <Esc>

" }}}

" OmniCompletion ----------------------- {{{
    "au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
    set omnifunc=syntaxcomplete#Complete

    " NOTE: I now handle C/C++ completion with clang_complete. Clang is required
    " for the omnicompletion to work

" }}}

" Mini-snippets {{{
" Commonly used and annoying to type
" inoremap <C-J> -><C-X><C-O>

" Add a C style comment
imap <C-\> /*   */ <Left><Left><Left><Left><Left>

" }}}

" Misc {{{
"Window resizing
nnoremap <c-left> 5<c-w>>
nnoremap <c-right> 5<c-w><

"Clean trailing whitespace
nnoremap ,ww mz:%s/\s\+$//<cr>:let @/=''<cr>`z

"substitute
nnoremap ,s :%s/

"HTML tag closing
inoremap <C-_> <space><bs><esc>:call InsertCloseTag()<cr>a


"Source files with leader S
vnoremap ,S y:execute @@<cr>:echo 'Sourced selection.'<cr>
nnoremap ,S ^vg_y:execute @@<cr>:echo 'Sourced line.'<cr>

"Calculator
inoremap <C-B> <C-O>yiW<End>=<C-R>=<C-R>0<CR>

" Redraw my Screen
nnoremap U :syntax sync fromstart<cr>:redraw!<cr>

"apply sudo to opened file
cmap w!! w !sudo tee % >/dev/null

"converts the current word in insert mode to uppercase
inoremap <C-k> <esc>mzgUiw`za

"Grep current word under cursor
nnoremap <F5> :grep <C-R><C-W> *<CR>

"File Format
"Windows
command Dos :e ++ff=dos
command Mac :e ++ff=mac
command Unix :e ++ff=unix

"Disable Warnings
" set shortmess=at


" }}}

"Program Shortcuts {{{

" nnoremap <F11> :exe ':silent !chrome%'<CR>
" }}}

" File Navigation {{{
nmap ,v ;vsplit 
nmap ,h ;split 
nmap ,t ;tabedit 

" }}}

" Visual Selection {{{

" Select entire buffer
nnoremap vaa ggvGg_
nnoremap Vaa ggVG"

"Visual reselection
nnoremap ,V V`]

"Visually select current line excluding indentation
nnoremap vv ^vg_
" }}}

" Custom Functions {{{
"<F4> Switch between source and header for cpp files <
function! SwitchSourceHeader() "{{{
    "update!
    if (expand ("%:e") == "cpp" || expand("%:e") == "c")
        find %:t:r.h
    else
        find %:t:r.cpp
        "find %:t:r.c Need to update this function to work for C and CPP files
        "at the same time
    endif
endfunction " }}}
nmap <F4> :call SwitchSourceHeader()<CR>

" Indentation guides for python
let g:indentguides_state = 0
function! IndentGuides() " {{{
    if g:indentguides_state
        let g:indentguides_state = 0
        2match None
    else
        let g:indentguides_state = 1
        execute '2match IndentGuides /\%(\_^\s*\)\@<=\%(\%'.(0*&sw+1).'v\|\%'.(1*&sw+1).'v\|\%'.(2*&sw+1).'v\|\%'.(3*&sw+1).'v\|\%'.(4*&sw+1).'v\|\%'.(5*&sw+1).'v\|\%'.(6*&sw+1).'v\|\%'.(7*&sw+1).'v\)\s/'
    endif
endfunction " }}}
hi def IndentGuides guibg=#303030 ctermbg=234
nnoremap ,I :call IndentGuides()<cr>

"<,-I> Indentation Guides used for writing python.

" }}}

" Quick editing -------------------------------------------------- {{{
nnoremap ,ev :e $MYVIMRC<cr>
" }}}

" My Remappings -------------------------------------------------- {{{
"nnoremap + @
"vnoremap + @
"nnoremap ++ @@
"vnoremap ++ @@
"nnoremap ' ;
"vnoremap ' ;
nnoremap ; :
vnoremap ; :
"nnoremap : '
"vnoremap : '
let mapleader=","
let maplocalleader = ","
" }}}

" vim:foldmethod=marker:foldlevel=0
