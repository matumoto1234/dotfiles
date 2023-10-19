" 基本設定------------------------------------------- {{{

" set集 {{{
set number
" タブ類 {{{
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab
" }}}
set completeopt=menuone,noinsert
set laststatus=2
set cursorline
set incsearch
set hlsearch
set showmatch
set matchtime=1
set pumheight=10
set whichwrap=h,l
set clipboard=unnamedplus
set backspace=indent,eol,start
set timeout timeoutlen=1000
" }}}
" キーバインド {{{
let mapleader = "\<Space>"
" nnoremaps {{{

nmap Y y$

nnoremap <Leader>+ <C-a>
nnoremap <Leader>- <C-x>
nnoremap <Leader>w<CR> :w<CR>
nnoremap <Leader>wq<CR> :wq<CR>
nnoremap <Leader>h 0
nnoremap <Leader>j $
nnoremap <Leader>jd gD
nnoremap <Leader>jp gd
nnoremap x "_x
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nmap <Leader>w [WINDOW]
  nnoremap [WINDOW]h <C-W>
  nnoremap [WINDOW]v :vs<CR>
  nnoremap [WINDOW]s :split<CR>
  nnoremap [WINDOW]d :q!<CR>
nmap <Leader>t [TAB]
  nnoremap [TAB]j gt
  nnoremap [TAB]h gt
  nnoremap [TAB]k gT
  nnoremap [TAB]l gT
  nnoremap [TAB]L :+tabmove<CR>
  nnoremap [TAB]H :-tabmove<CR>
  nnoremap [TAB]d :tabclose<CR>
  nnoremap [TAB]n :tabnew<CR>
" }}}
" inoremaps {{{
inoremap jj <Esc>
inoremap JJ <Esc>
" inoremap {<CR> {<CR>}<Esc>O
" inoremap [<CR> [<CR>]<Esc>O
" inoremap (<CR> (<CR>)<Esc>O
" inoremap '' ''<esc>i
" inoremap \"\" \"\"<esc>i
" inoremap {} {}<esc>i
" inoremap () ()<esc>i
" inoremap <> <><esc>i
" }}}
" vnoremaps {{{
" }}}
" tnoremap {{{
tnoremap jj <C-\><C-n>
" }}}
"
" }}}
" 折り畳み
autocmd FileType vim setlocal foldmethod=marker
" autocmd FileType cpp setlocal foldmethod=syntax
"set foldcolumn=4
"
" カラースキーム {{{
colorscheme koehler
syntax enable
" }}}

"基本設定終了--------------------------------------- }}}

hi Normal          ctermfg=252 ctermbg=none

