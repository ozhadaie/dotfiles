let mapleader=","
map <Leader>e :vsp ~/.vimrc<CR>
"" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

"{{{					PLUGINS:

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

"{{{ NERDCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" }}}

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
set termguicolors
nnoremap n nzzzv
nnoremap N Nzzzv
colorscheme base16-default-dark
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

"{{{	TABS
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
nnoremap ,html :-1read $HOME/.vim/snippets/some.snp<CR>
