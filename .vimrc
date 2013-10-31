set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
" My Bundles here:
"
" original repos on github
Bundle 'scrooloose/nerdtree'
Bundle 'StanAngeloff/php.vim'
Bundle 'othree/html5.vim'
Bundle 'vim-scripts/simple-pairs'
Bundle 'an1zhegorodov/vim-colorschemes'
"Bundle 'ludovicPelle/vim-xdebug'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
set t_Co=256
set softtabstop=4
set shiftwidth=4
set ff=unix
set expandtab
set autoindent
set number
set ruler
colorscheme github

" Switch to normal mode when in insert mode
:imap jj <Esc>

" Switch between tabs with Ctrl-h/l
:map <C-h> :tabp<Enter>
:map <C-l> :tabn<Enter>

" ; Adds a semicolon to the end of the line when in normal mode
noremap ; :s/\([^;]\)$/\1;/<cr>:nohls<cr>

" Remove newline symbol at the end of php files (damn ?>)
au BufWritePre *.php :set binary | set noeol
au BufWritePost *.php :set nobinary | set eol

" Setting gui font
if has('gui_running')
  set guifont=Liberation\ Mono\ 9,3
endif

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
