set background=dark
set t_Co=256
set relativenumber
let g:session_autosave = 'no'
set enc=utf-8
set nowrap
set wildmenu
set fileencodings=utf-8,koi8-r
let mapleader=","
let g:C_MapLeader=""
map <Leader>e :vsp ~/.vimrc<CR>
"" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
autocmd BufWinEnter * silent :TagbarOpen<CR>
"{{{					PLUGINS:

"{{{
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16

let g:rbpt_loadcmd_toggle = 0
"}}}

"{{{	NERDTree:
"
"{{{ NERDTrees File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" source files
call NERDTreeHighlightFile('.c', '11', 'NONE', 'NONE', 'NONE')
call NERDTreeHighlightFile('h', '3', 'NONE', 'NONE', 'NONE')
call NERDTreeHighlightFile('cc', '5', 'NONE', 'NONE', 'NONE')
call NERDTreeHighlightFile('mm', '4', 'NONE', 'NONE', 'NONE')
" shell scripts
call NERDTreeHighlightFile('sh', '2', 'NONE', 'NONE', 'NONE')
call NERDTreeHighlightFile('bash', '2', 'NONE', 'NONE', 'NONE')
call NERDTreeHighlightFile('zsh', '2', 'NONE', 'NONE', 'NONE')
" makefiles
call NERDTreeHighlightFile('mk', '13', 'NONE', 'NONE', 'NONE')
call NERDTreeHighlightFile('makefile', '13', 'NONE', 'NONE', 'NONE')
call NERDTreeHighlightFile('Makefile', '13', 'NONE', 'NONE', 'NONE')
"}}}

let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
map <Leader>m :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeIgnore=['\.o$', '\.out$', '\~$', '\.pyc$']
let g:NERDTreeShowBookmarks=1
let g:NERDTreeWinSize=30
"}}}


" {{{ Airline

let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts = 1
if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
endif
" vim-airline
let g:airline#extensions#virtualenv#enabled = 1

" }}}

" {{{ ALE
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_column_always = 1
" Show 5 lines of errors (default: 10)
let g:ale_list_window_size = 5
" }}}

" }}}

"{{{					BASIC SETUP:

if $COLORTERM == 'gnome-terminal'
  set term=gnome-256color
else
  if $TERM == 'xterm'
    set term=xterm-256color
  endif
endif

if &term =~ '256color'
  set t_ut=
endif

if exists('$SHELL')
  set shell=$SHELL
else
  set shell=/bin/sh
endif

let g:session_directory = "~/.vim/session"
nnoremap <silent> <leader>sh :terminal<CR>
"set termguicolors
nnoremap n nzzzv
nnoremap N Nzzzv
"colorscheme base16-default-dark
let base16colorspace=256

set gcr=a:blinkon0
set scrolloff=5
set laststatus=2
set number
set ruler
set cc=79
set cursorline
set cursorcolumn
" enter the current millenium
set mouse=a
set clipboard=unnamed
set nocompatible
" enable syntax and plugins (for netrw)
syntax enable
filetype plugin indent on

set noswapfile
set nobackup
set nowritebackup
" }}}

" {{{ MAPPINGS

"-------------------------------------------------------------------------------
"  some additional hot keys
"-------------------------------------------------------------------------------
"    F2   -  write file without confirmation
"    F3   -  call file explorer Ex
"    F4   -  show tag under curser in the preview window (tagfile must exist!)
"    F5   -  open quickfix error window
"    F6   -  close quickfix error window
"    F7   -  display previous error
"    F8   -  display next error
"-------------------------------------------------------------------------------
"
map   <silent> <F2>        :write<CR>
map   <silent> <F3>        :Explore<CR>
nmap  <silent> <F4>        :exe ":ptag ".expand("<cword>")<CR>
map   <silent> <F5>        :copen<CR>
map   <silent> <F6>        :cclose<CR>
map   <silent> <F7>        :cp<CR>
map   <silent> <F8>        :cn<CR>
"
map <silent> <F9> :!clear && python3.7 %<CR>
imap  <silent> <F2>   <Esc>:write<CR>
imap  <silent> <F3>   <Esc>:Explore<CR>
imap  <silent> <F4>   <Esc>:exe ":ptag ".expand("<cword>")<CR>
imap  <silent> <F5>   <Esc>:copen<CR>
imap  <silent> <F6>   <Esc>:cclose<CR>
imap  <silent> <F7>   <Esc>:cp<CR>
imap  <silent> <F8>   <Esc>:cn<CR>
"
vnoremap ( s()<Esc>P<Right>%
vnoremap [ s[]<Esc>P<Right>%
vnoremap { s{}<Esc>P<Right>%
"
"-------------------------------------------------------------------------------
" autocomplete quotes (visual and select mode)
"-------------------------------------------------------------------------------
xnoremap  '  s''<Esc>P<Right>
xnoremap  "  s""<Esc>P<Right>
xnoremap  `  s``<Esc>P<Right>
"
"-------------------------------------------------------------------------------
" Change the working directory to the directory containing the current file
"-------------------------------------------------------------------------------
if has("autocmd")
  autocmd BufEnter * :lchdir %:p:h
endif " has("autocmd")
"
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>


nnoremap <Leader>o :.Gbrowse<CR>
"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv



map <C-h> <C-W><C-h>
map <C-j> <C-W><C-j>
map <C-k> <C-W><C-k>
map <C-l> <C-W><C-l>

noremap <Left> <Nop>
noremap <Up> <Nop>
noremap <Right> <Nop>
noremap <Down> <Nop>
map ; :

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
" }}}

"{{{	INDENT
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set smarttab
set cindent
" }}}

"{{{ 	FOLDING
set fdm=marker
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf
autocmd BufWinLeave *.* mkview!
autocmd BufWinEnter *.* silent loadview
set foldmethod=manual
" }}}

" {{{ augroups
augroup vimrc-remember-cursor-positional
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead Makefile setlocal filetype=make
augroup END

set autoread
" }}}
