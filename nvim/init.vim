set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
set showcmd
set ruler
" set cursorline
set encoding=utf-8
set showmatch
set sw=2
" set relativenumber
set laststatus=2
set noshowmode
set t_Co=256
call plug#begin('~/.vim/plugged')

"Themes

Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'

" IDE
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'hhatto/autopep8'

"Clang Formatter
Plug 'rhysd/vim-clang-format'

call plug#end()

colorscheme molokai

let NERDTreeQuitOnOpen=1
let mapleader=" "

" Clang Formatter settings for Betty Style
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11",
            \ "BreakBeforeBraces" : "Allman",
            \ "UseTab" : "ForIndentation",
            \ "TabWidth" : "4",
            \ "IndentWidth" : "4",
            \ "AllowShortIfStatementsOnASingleLine" : "false",
	    \ "AllowShortFunctionsOnASingleLine" : "None",
	    \ "AllowShortLoopsOnASingleLine" : "false"}

nmap <Leader>c :ClangFormat<CR>

nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>

" Mapping singles characters like (“‘’, into
" doubles as ()‘’“”
inoremap { {}<ESC>i
inoremap ( ()<ESC>i
inoremap ” “”<ESC>i
inoremap ' ''<ESC>i
inoremap [ []<ESC>i

