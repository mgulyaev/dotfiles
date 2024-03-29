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


if executable("xclip")
    vmap <A-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
    nmap <A-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p
endif

set mouse=a

nnoremap <M-o> :A<CR>
nmap <leader>h :set hlsearch! hlsearch?<CR>
set incsearch

" turn off compatibility with vi
set nocompatible

set backupdir=~/.vim/backup//
set directory=~/.vim/swp//
set undodir=~/.vim/undodir//
set undofile

if empty(glob(&backupdir)) || empty(glob(&directory) || empty(&undodir))
    silent !mkdir -p ~/.vim/backup
    silent !mkdir -p ~/.vim/swp
    silent !mkdir -p ~/.vim/undodir
endif


if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set expandtab   " Replaces tab with spaces in insert mode
set autoindent  " Copies indent spaces from previous line to next line
set smartindent " autoindent + adds indent after opening brace and some other cases.

set cindent " Enables C smart indent style
set cinoptions+=g1 " Place C++ scope label N chars from the indent of the block they are in
set cinoptions+=h1 " Place statements after a C++ scope label N chars from the indent of the label
set cinoptions+=N-s
set cinoptions+=j1 " Indent java anonymous classes correctly

set backspace=2
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

""""""""""""""""""""""""""""""""""""""""""""""""""
" Hotkeys
""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap ; :
vnoremap ; :
" nnoremap n nzz
" nnoremap N Nzz

nnoremap <C-s> :update<CR>
inoremap <C-s> <Esc>:update<CR>
vnoremap <C-s> <Esc>:update<CR>

nnoremap <C-k><C-b> :NERDTreeToggle<CR>

nnoremap <C-h> :bprev<CR>
nnoremap <C-l> :bnext<CR>

nnoremap <leader>ev :sp $MYVIMRC<CR>
" nnoremap <leader>tt :Tagbar<CR>
nnoremap <F12> :syn sync fromstart<CR>
nnoremap <leader>ww :e ++ff=dos<CR>
nnoremap <leader>r :CtrlPBufTag<CR>

map <C-_> <Plug>NERDCommenterToggle
map <leader>c<space> <Plug>NERDCommenterToggle

nnoremap <leader>p :Files<CR>
nnoremap <leader>o :Commands<CR>
nnoremap <leader>P :Commands<CR>
nnoremap <leader>r :Tags<CR>
nnoremap <C-p> :Files<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""
" Vim plug
""""""""""""""""""""""""""""""""""""""""""""""""""

let g:move_key_modifier = 'M'
let g:UltiSnipsExpandTrigger = '<C-l>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJupBackwardTrigger = '<C-k>'
let g:clang_format#command = 'clang-format-13'
let g:clang_format#detect_style_file = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let NERDSpaceDelims = 1
let NERDDefaultAlign = 'left'

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0
let g:ycm_confirm_extra_conf = 0

let g:goyo_width = 100

let g:AutoPairsMultilineClose = 0

let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1

if executable("fd")
    let g:ctrlp_user_command = 'fd -c never "" %s'
    let g:ctrlp_use_caching = 0
endif

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cmd = 'CtrlPCurWD'
let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git$\|\.svn$\|target',
    \ 'file': '\v\.(bin|gz|d|o|obj|docx|doc|a)$'
    \ }
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_extensions = ['tag', 'buffertag', 'cmdpalette']
let g:ctrlp_cmdpalette_execute = 1

let g:fzf_layout = { 'down': '~40%' }

let g:signify_vcs_list = [ 'git', 'svn' ]

let g:alternateSearchPath = 'reg:|/\([^/]*\)/src|/\1/include/\1|,reg:|/include/\([^/]*\)|/src|'
let g:alternateSearchPath .= ',reg:/inc/src/g/,reg:/src/inc/g/'

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

call plug#begin()

" Plug 'mhinz/vim-signify'
" Plug 'juneedahamed/vc.vim'
" Plug 'matze/vim-move'

Plug 'vim-scripts/a.vim'

Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }

" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'tacahiroy/ctrlp-funky'
" Plug 'fisadev/vim-ctrlp-cmdpalette'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


" Plug 'majutsushi/tagbar', { 'on': 'Tagbar' }
" Plug 'sirver/ultisnips'

Plug 'jiangmiao/auto-pairs'


Plug 'w0ng/vim-hybrid'
Plug 'KeitaNakamura/neodark.vim'

Plug 'ntpeters/vim-better-whitespace'

" Optional syntax plugins

" Plug 'rust-lang/rust.vim', {'for': 'rust'}
" Plug 'cespare/vim-toml', {'for': 'toml'}
" Plug 'scrooloose/vim-slumlord'
" Plug 'aklt/plantuml-syntax'
" Plug 'vim-scripts/DoxygenToolkit.vim'
" Plug 's3rvac/vim-syntax-redminewiki'
" Plug 'rhysd/vim-gfm-syntax'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'maralla/completor.vim'
Plug 'rhysd/vim-clang-format'

call plug#end()

augroup file_type_specific
    autocmd!
    au FileType markdown,redminewiki vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>
    au FileType markdown setlocal nu!
    au FileType markdown setlocal colorcolumn=
    au FileType html syntax sync fromstart
    au FileType c,cpp set shiftwidth=2
    au FileType c,cpp set tabstop=2
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
    au BufRead,BufNewFile *.launch set filetype=xml
    au BufRead,BufNewFile *.rasi set filetype=css
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

if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
        autocmd FileType objc setlocal omnifunc=lsp#complete
        autocmd FileType objcpp setlocal omnifunc=lsp#complete
    augroup end
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

" Use TAB to complete when typing words, else inserts TABs as usual.  Uses
" dictionary, source files, and completor to find matching words to complete.

" Note: usual completion is on <C-n> but more trouble to press all the time.
" Never type the same word twice and maybe learn a new spellings!
" Use the Linux dictionary when spelling is in doubt.
function! Tab_Or_Complete() abort
  " If completor is already open the `tab` cycles through suggested completions.
  if pumvisible()
    return "\<C-N>"
  " If completor is not open and we are in the middle of typing a word then
  " `tab` opens completor menu.
  elseif col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^[[:keyword:][:ident:]]'
    return "\<C-R>=completor#do('complete')\<CR>"
  else
    " If we aren't typing a word and we press `tab` simply do the normal `tab`
    " action.
    return "\<Tab>"
  endif
endfunction

" Use `tab` key to select completions.  Default is arrow keys.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

set background=dark
if has('termguicolors')
   " set vim-specific sequences for rgb colors, useful for tmux sessions
   let &t_8f = "\<esc>[38;2;%lu;%lu;%lum"
   let &t_8b = "\<esc>[48;2;%lu;%lu;%lum"

   set termguicolors

   silent! colorscheme neodark
   highlight endofbuffer guifg=bg
else
    silent! colorscheme neodark
endif

if has('gui_running')
    set guioptions-=T
    set guioptions-=L
    set guioptions-=r
    set guioptions-=b
endif

set exrc
set secure
