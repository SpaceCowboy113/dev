" Source: https://github.com/SpaceCowboy113/vimrc/blob/master/.vimrc

" Vundle (Plugin Management)
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
filetype off
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" My Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'

Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'maxbrunsfeld/vim-yankstack'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'godlygeek/csapprox'
Plugin 'kien/ctrlp.vim'
Plugin 'derekwyatt/vim-scala'
"Plugin 'goldfeld/vim-seek'
Plugin 'vim-scripts/SearchComplete'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-markdown'
Plugin 'vim-ruby/vim-ruby'
Plugin 'sentientmachine/Pretty-Vim-Python'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'Raimondi/delimitMate'
Plugin 'marijnh/tern_for_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ervandew/supertab'
Plugin 'mhinz/vim-startify'
Plugin 'mileszs/ack.vim'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'scrooloose/syntastic'
"Plugin 'edkolev/tmuxline.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'vim-scripts/Improved-paragraph-motion'

" Text Objects
Plugin 'bkad/CamelCaseMotion'
Plugin 'vim-scripts/argtextobj.vim'
Plugin 'michaeljsmith/vim-indent-object'

" Color schemes
Plugin 'sjl/badwolf'
Plugin 'tomasr/molokai'
Plugin 'quanganhdo/grb256'
Plugin 'altercation/vim-colors-solarized'
Plugin 'w0ng/vim-hybrid'
Plugin 'nanotech/jellybeans.vim'
Plugin 'djjcast/mirodark'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'lsdr/monokai'
Plugin 'jpo/vim-railscasts-theme'

" (Optional) Completion
" Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on
" 

" Windows 
" set showbreak=¬
" 

" Linux 
" set list
"set listchars=extends:❯,precedes:❮
" set listchars=eol:$,tabs:>,trail:~,extends:>,precedes:<
set showbreak=↪
" 

" Colors ----------------------------------------------------------------------------- 

set t_Co=256
set term=screen-256color
let base16colorspace=256
colorscheme base16-default
set background=dark
syntax enable

" ------------------------------------------------------------------------------------- 

" Options ----------------------------------------------------------------------------- 

" Syntax highlighting turned on
syntax on

" My gui options
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guifont=Monaco:h12


" Map leader to , and remap , to <Ctrl + E>
let localleader=','
let maplocalleader=','        " all my macros start with ,
let mapleader=','
nnoremap <C-E> ,

set modeline
set modelines=5
set ruler                     " show the line number on the bar
set more                      " use more prompt
" One of these is causing bug
set autoread                  " watch for file changes
set number                    " line numbers
set hidden
set noautowrite               " don't automagically write on :next
" set lazyredraw                " don't redraw when don't have to
set showmode
set showcmd
set autoindent 
set cindent
set smartindent    " auto/smart indent
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
set ttyfast                   " we have a fast terminal
set mouse=a
set noerrorbells              " No error bells please
set shell=bash
set fileformats=unix
set ff=unix
set wildignore=*.o,*.obj,*.bak,*.exe
set wildmode=longest:full
set wildmenu                  " menu has tab completion
" causes bug with tmux
set laststatus=2
"" set relativenumber
set viminfo=%100,'100,/100,h,\"500,:100,n~/.viminfo
" redefine 'word'
"set iskeyword-=_
set cc=80
"" ------------------------------------------------------------------------------------- 

" Plugin Settings 
" Ultisnips 
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"Split window vertical"
let g:UltiSnipsEditSplit="vertical"
" 

" YouCompleteMe 
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
" 

" vim-cpp-enhanced-highlight 
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" Tags 
set tags+=~/tags
set tags+=~/.vim/tags/cpp
"Build tags for own project
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" 

"  searching 
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

"clear search
nnoremap ,, :nohls<cr>
" 

"  Folding --------------------------------------------------- 
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
"set nofoldenable        "dont fold by default
"set foldlevel=1         "this is just what i use
set foldenable
set foldlevelstart=10
"au BufRead * normal zM "Fold files when opening
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

"function! MyFoldText() " 
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
"endfunction " 
"set foldtext=MyFoldText()
" 

" Backup --------------------------------------------------------- 
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
" 

" spelling 
if v:version >= 700
    " Enable spell check for text files
    autocmd BufNewFile,BufRead *.txt setlocal spell spelllang=en
endif
" 

" Navigation {

" hjkl shift/ctrl modifiers
nnoremap <C-Y> <S-J>
vnoremap <C-Y> <S-J>

nnoremap <S-J> 4gj
nnoremap <S-K> 4gk

nnoremap <C-J> 14gj
nnoremap <C-K> 14gk

vnoremap <S-J> 4gj
vnoremap <S-K> 4gk

vnoremap <C-J> 14gj
vnoremap <C-K> 14gk

nnoremap <C-H> ^
nnoremap <C-L> $

vnoremap <C-H> ^
vnoremap <C-L> $

" Go to beginning or end of line in insert mode
inoremap <c-z> <esc>I
inoremap <c-a> <esc>A

"map <C-M> to match parentheses
nnoremap <C-M> %
vnoremap <C-M> %

" 

" OmniCompletion ----------------------- 
    au BufNewFile,BufRead,BufEnter *.cpp,*.hpp set omnifunc=omni#cpp#complete#Main
    set omnifunc=syntaxcomplete#Complete

    " NOTE: I now handle C/C++ completion with clang_complete. Clang is required
    " for the omnicompletion to work

" 

" Mini-snippets 
" Commonly used and annoying to type
imap <C-h> ->
imap <C-y> ==
imap <C-u> !=
imap <C-\> /*   */ <Left><Left><Left><Left><Left>

" Misc 
"Window resizing
nnoremap <c-left> 5<c-w>>
nnoremap <c-right> 5<c-w><

"Clean trailing whitespace
nnoremap ,kk mz:%s/\s\+$//<cr>:let @/=''<cr>`z

"substitute
nnoremap ,su :%s/

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
nnoremap <F1> :grep <C-R><C-W> *<CR>

"File Format
"Windows
command Dos :e ++ff=dos
command Mac :e ++ff=mac
command Unix :e ++ff=unix

"Disable Warnings
" set shortmess=at

" 

"Program Shortcuts 

" nnoremap <F11> :exe ':silent !chrome%'<CR>
" 

" File Navigation 
nmap ,v :vsplit<cr>
nmap ,h :split<cr>
nmap ,t :tabedit<cr>

" 

" Visual Selection 

" Select entire buffer
nnoremap vaa ggvGg_
nnoremap Vaa ggVG"

"Visual reselection
nnoremap <leader>V V`]

"Visually select current line excluding indentation
nnoremap vv ^vg_
" 

"<,-I> Indentation Guides used for writing python. 
let g:indentguides_state = 0
function! IndentGuides() " 
    if g:indentguides_state
        let g:indentguides_state = 0
        2match None
    else
        let g:indentguides_state = 1
        execute '2match IndentGuides /\%(\_^\s*\)\@<=\%(\%'.(0*&sw+1).'v\|\%'.(1*&sw+1).'v\|\%'.(2*&sw+1).'v\|\%'.(3*&sw+1).'v\|\%'.(4*&sw+1).'v\|\%'.(5*&sw+1).'v\|\%'.(6*&sw+1).'v\|\%'.(7*&sw+1).'v\)\s/'
    endif
endfunction
hi def IndentGuides guibg=#303030 ctermbg=234
nnoremap ,I :call IndentGuides()<cr>

" 

" Quick editing -------------------------------------------------- 
nnoremap ,lv :e $MYVIMRC<cr>
nnoremap ,lz :e ~/.zshrc<cr>

" RaaSCAL project
nnoremap ,lrs :e ~/Citrix/raascal/scripts<cr>
nnoremap ,lrf :e ~/Citrix/raascal/fixture<cr>
nnoremap ,lrh :e ~/Citrix/raascal<cr>
nnoremap ,lrg :e ~/Citrix/raascal/Gruntfile.js<cr>

" Edit Snippets
nnoremap ,lscp :e  ~/.vim/bundle/vim-snippets/snippets/cpp.snippets<cr>
nnoremap ,lsj :e  ~/.vim/bundle/vim-snippets/snippets/javascript<cr>

" New things 
" Toggle paste mode
nmap <silent> ,m :set invpaste<CR>:set paste?<CR>
"-----------------------------------------------------------------------------
" CtrlP Settings
"-----------------------------------------------------------------------------
let g:ctrlp_switch_buffer = 'E'
let g:ctrlp_tabpage_position = 'c'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_root_markers = ['.project.root']
let g:ctrlp_custom_ignore = '\v'
let g:ctrlp_custom_ignore .= '%(/\.'
let g:ctrlp_custom_ignore .= '%(git|hg|svn)|'
let g:ctrlp_custom_ignore .= '\.%(class|o|png|jpg|jpeg|bmp|tar|jar|tgz|deb|zip|)$|'
let g:ctrlp_custom_ignore .= '/target/%(quickfix|resolution-cache|streams)|'
let g:ctrlp_custom_ignore .= '/target/scala-2.1./%(classes|test-classes|sbt-0.13|cache)|'
let g:ctrlp_custom_ignore .= '/project/target|/project/project|node_modules|DS_STORE|git|bower|dist*|rtcgw-js|tools'
let g:ctrlp_custom_ignore .= ')'
let g:ctrlp_open_new_file = 'r'
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

"-----------------------------------------------------------------------------
" Fix Spelling Mistakes
"-----------------------------------------------------------------------------
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

" goyo
let g:goyo_width = 100
let g:goyo_margin_top = 4

nnoremap <silent> <F4> :FSHere<cr>
nnoremap <silent> <F5> :Goyo<cr>

set guicursor=n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor,r-cr:hor20-Cursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
set mousehide

" Wipe out all buffers
nmap <silent> ,kb :1,9000bwipeout<cr>

" Indented paste
" nnoremap p p==

" Try out jj as esc
"imap jj <esc>
"cmap jj <esc>

" Make the current file executable
nmap ,x :w<cr>:!chmod 755 %<cr>:e<cr>

" Make the 'cw' and like commands put a $ at the end instead of just deleting
" the text and replacing it
" set cpoptions=ces$

" vim-cpp-enchanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" vim-airline
let g:airline_detect_paste=1
let g:airline_powerline_fonts = 1

" Syntastic
"let g:syntastic_always_populate_loc_list = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers=['eslint']
"let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_loc_list_height = 3

" Quick Fix List
function! ToggleErrors()
    if empty(filter(tabpagebuflist(), 'getbufvar(v:val, "&buftype") is# "quickfix"'))
         " No location/quickfix list shown, open syntastic error location panel
         Errors
    else
        lclose
    endif
endfunction

nnoremap <silent> ,dd :<C-u>call ToggleErrors()<CR>
nnoremap <silent> ,df :lnext<cr>
nnoremap <silent> ,ds :lprev<cr>

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#W',
      \'c'    : '#H',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : '#W %R',
      \'z'    : '#H'}

" YankStack
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste

" DelimitMate 
let delimitMate_expand_cr = 1 " Insert newline after '{' + '\n'

" Js Docs
nnoremap <silent> ,jd :JsDoc<cr>

" Nerd Tree
nnoremap <silent> ,nt :NERDTreeToggle<cr>
nnoremap <silent> ,nf :NERDTreeFind<cr>
nnoremap <silent> ,nw :NERDTreeCWD<cr>
nnoremap <silent> ,nc :NERDTreeClose<cr>

" Camel Case Text Object
"map <silent> <M-w> <Plug>CamelCaseMotion_w
"map <silent> <M-b> <Plug>CamelCaseMotion_b
"map <silent> <M-e> <Plug>CamelCaseMotion_e
"map <silent> <M-ge> <Plug>CamelCaseMotion_e
"sunmap <M-w>
"sunmap <M-b>
"sunmap <M-e>
"sunmap <M-ge>

" Defines custom 'in word functions'
"omap <silent> iw <Plug>CamelCaseMotion_iw
"xmap <silent> iw <Plug>CamelCaseMotion_iw
"omap <silent> ib <Plug>CamelCaseMotion_ib
"xmap <silent> ib <Plug>CamelCaseMotion_ib
"omap <silent> ie <Plug>CamelCaseMotion_ie
"xmap <silent> ie <Plug>CamelCaseMotion_ie

" Highlight text over 80 chars
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/


" vim:foldmethod=marker:foldlevel=0
