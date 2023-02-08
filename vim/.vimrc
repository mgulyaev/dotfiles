set encoding=utf-8

" Enable alt-key
"
" http://vim.wikia.com/wiki/Fix_meta-keys_that_break_out_of_Insert_mode
" Note: this code breaks <Esc>-containing macros... possibly 'imap <Esc> <C-c>' fixes this
let c='a'
while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
endw

" " Not sure if it is correct
" imap <Esc> <C-c>

if executable("xclip")
    vmap <A-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
    nmap <A-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
endif

set mouse=a

nnoremap <M-o> :A<CR>
nmap <leader>h :set hlsearch! hlsearch?<CR>
set incsearch
" inoremap <Esc> <C-c>

" turn off compatibility with vi
set nocompatible
set noshowmode

set backupdir=~/.vim/backup//
set directory=~/.vim/swp//
set undodir=~/.vim/undodir//

set undofile

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if empty(glob(&backupdir)) || empty(glob(&directory) || empty(&undodir))
    silent !mkdir -p ~/.vim/backup
    silent !mkdir -p ~/.vim/swp
    silent !mkdir -p ~/.vim/undodir
endif

" Use spaces instead of tabs
set expandtab
set autoindent
set smartindent
set cindent
set cinoptions+=g0
set cinoptions+=N-s
set cinoptions+=j1

set backspace=2
" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set wildmenu
set wildmode=longest:full,full

set ignorecase
set smartcase

set list!
" set listchars=tab:――
" set listchars=tab:>―
set listchars=tab:▶\ ,trail:·,extends:↩,nbsp:.

syntax on
set number
set numberwidth=4

set cursorline
set laststatus=2

set colorcolumn=101

set timeoutlen=1000 ttimeoutlen=0 " set timeout for mapping delays / code delays

set hidden

set splitright
set splitbelow

set lazyredraw

""""""""""""""""""""""""""""""""""""""""""""""""""
" Hotkeys
""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap ; :
vnoremap ; :
" nnoremap n nzz
" nnoremap N Nzz

nnoremap <C-s> :update<CR>
" nnoremap <C-s><C-s> :w<CR>
inoremap <C-s> <Esc>:update<CR>
vnoremap <C-s> <Esc>:update<CR>

nnoremap <C-k><C-b> :NERDTreeToggle<CR>

nnoremap <C-h> :bprev<CR>
nnoremap <C-l> :bnext<CR>

nnoremap <leader>ev :sp $MYVIMRC<CR>
nnoremap <leader>pp :CtrlP<CR>
nnoremap <leader>tt :Tagbar<CR>
nnoremap <F12> :syn sync fromstart<CR>
nnoremap <leader>ww :e ++ff=dos<CR>
nnoremap <leader>o :CtrlPCmdPalette<CR>
nnoremap <leader>r :CtrlPBufTag<CR>

" nnoremap <C-p> :CtrlP\ :pwd<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""
" Vim plug
""""""""""""""""""""""""""""""""""""""""""""""""""

let g:move_key_modifier = 'M'
let g:UltiSnipsExpandTrigger = '<C-l>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJupBackwardTrigger = '<C-k>'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1

let NERDSpaceDelims = 1
let NERDDefaultAlign = 'left'

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" let g:ycm_enable_diagnostic_signs = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_confirm_extra_conf = 0

let g:goyo_width = 100

let g:AutoPairsMultilineClose = 0

" ------------------------------------- necomplete

" let g:acp_enableAtStartup = 0
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#sources#syntax#min_keyword_length = 2

" let g:neocomplete#sources#dictionary#dictionaries = {
"     \ 'default': '',
"     \ 'vimshell': $HOME.'/vimshell_hist'
"     \ }
" if !exists('g:neocomplete#keyword_patterns')
"     let g:neocomplete#keyword_patterns = {}
" endif
" let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"     return (pumvisible() ? "\<C-y>" : "") . "\<CR>"
" endfunction

" inoremap <expr><Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"


" ------------------------------------- neocomplete
"
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1

" if executable("fd")
"     let g:ctrlp_user_command = 'fd -c never "" "%s"'
"     let g:ctrlp_use_caching = 0
" endif

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cmd = 'CtrlPCurWD'
" let g:ctrlp_custom_ignore = {
"     \ 'dir': '\.git$\|\.svn$\|build\|target',
"     \ 'file': '\v\.(bin|gz|d|o|obj|docx|doc|a)$'
"     \ }
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git$\|\.svn$\|target',
    \ 'file': '\v\.(bin|gz|d|o|obj|docx|doc|a)$'
    \ }
" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_extensions = ['tag', 'buffertag', 'cmdpalette']
let g:ctrlp_cmdpalette_execute = 1

let g:fzf_layout = { 'down': '~40%' }

let g:signify_vcs_list = [ 'git', 'svn' ]

" let g:alternateSearchPath = 'reg:|/\([^/]*\)/src|/\1/inc/\1|,reg:|/inc/\([^/]*\)|/src|'
let g:alternateSearchPath = 'reg:|/\([^/]*\)/src|/\1/include/\1|,reg:|/include/\([^/]*\)|/src|'
let g:alternateSearchPath .= ',reg:/inc/src/g/,reg:/src/inc/g/'

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

call plug#begin()

" Plug 'blueyed/vim-diminactive'

" Plug 'ludovicchabant/vim-gutentags'
Plug 'mhinz/vim-signify'
" Plug 'juneedahamed/svnj.vim'
Plug 'juneedahamed/vc.vim'
" Plug 'tpope/vim-fugitive'
"
Plug 'matze/vim-move'
Plug 'rhysd/vim-gfm-syntax'

" Plug 'nacitar/a.vim'
Plug 'vim-scripts/a.vim'
" Plug 'LucHermitte/alternate-lite'

Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'ConradIrwin/vim-bracketed-paste'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'fisadev/vim-ctrlp-cmdpalette'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }

Plug 'majutsushi/tagbar', { 'on': 'Tagbar' }
Plug 'sirver/ultisnips'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

Plug 'valloric/youcompleteme', { 'do': './install.py --clang-completer --system-libclang' }
" Plug 'ajh17/VimCompletesMe'
" Plug 'Shougo/neocomplete'
Plug 'rhysd/vim-clang-format'

Plug 'w0ng/vim-hybrid'
Plug 'KeitaNakamura/neodark.vim'
Plug 'mhartington/oceanic-next'
Plug 'tyrannicaltoucan/vim-quantum'
" Plug 'octol/vim-cpp-enhanced-highlight'
" Plug 'altercation/vim-colors-solarized'

Plug 'ntpeters/vim-better-whitespace'

Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'scrooloose/vim-slumlord'
Plug 'aklt/plantuml-syntax'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 's3rvac/vim-syntax-redminewiki'

call plug#end()

augroup file_type_specific
    autocmd!
    au FileType markdown,redminewiki vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>
    au FileType markdown setlocal nu!
    au FileType markdown setlocal colorcolumn=
    au FileType html syntax sync fromstart
augroup END

augroup on_buf_write
    autocmd!
    autocmd BufWritePre * StripWhitespace
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
    autocmd BufWritePost $MYVIMRC AirlineRefresh
augroup END

augroup file_type_detect
    autocmd!
    au BufRead,BufNewFile *.lds set filetype=ld
    au BufRead,BufNewFile *.clang-format set filetype=yaml
    au BufRead,BufNewFile *.make set filetype=make
    au BufRead,BufNewFile *.redmine set filetype=redminewiki
    " au BufRead,BufNewFile *.h set filetype=cpp.doxygen
augroup END

augroup goyo_cmds
    autocmd User GoyoEnter Limelight
    autocmd User GoyoLeave Limelight!
augroup END

augroup cpp_specific
    autocmd!
    if filereadable(".clang-format")
        au FileType c,cpp ClangFormatAutoEnable
    endif
augroup END

set background=dark
if has('termguicolors')
   " set vim-specific sequences for rgb colors, useful for tmux sessions
   let &t_8f = "\<esc>[38;2;%lu;%lu;%lum"
   let &t_8b = "\<esc>[48;2;%lu;%lu;%lum"

   set termguicolors

   colorscheme neodark
   highlight endofbuffer guifg=bg
else
    colorscheme neodark
endif

if has('gui_running')
    set guioptions-=T
    set guioptions-=L
    set guioptions-=r
    set guioptions-=b
endif

set exrc
set secure
