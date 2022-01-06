set number
set nowrap
syntax on
set nohlsearch
set showcmd
filetype indent on
set nocompatible
set noundofile
set noswapfile
set nobackup
set nobk nowb noswf noudf
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab
filetype off
set backspace=indent,eol,start
let skip_defaults_vim=1
set viminfo=""

set backupdir=$HOME/.vim/backup     "directory where the undo files will be stored
if has('persistent_undo')         "check if your vim version supports
  set undodir=$HOME/.vim/undo     "directory where the undo files will be stored
  set undofile                    "turn on the feature
  set noundofile
  set noswapfile
  set nobackup
  set nobk nowb noswf noudf
endif

function! Comment()
    let ext = tolower(expand('%:e'))
    if ext == 'py' 
              let cmt1 = "'''"
	      let cmt2 = "'''"   
    elseif ext == 'cpp' || ext =='java' || ext == 'css' || ext == 'js' || ext == 'c' || ext =='cs' || ext == 'rs' || ext == 'go'
	      let cmt1 = '/*'
	      let cmt2 = '*/'
    elseif ext == 'sh'
	      let cmt1 = ": '"
	      let cmt2 = "'"
    elseif ext == 'html'
	      let cmt1 = "<!--"
	      let cmt2 = "-->"
    elseif ext == 'hs'
	      let cmt1 = "{-"
	      let cmt2 = "-}"
    elseif ext == "rb"
	      let cmt1 = "=begin"
	      let cmt2 = "=end"
    endif
    exe line("'<")."normal O". cmt1 | exe line("'>")."normal o". cmt2 
endfunction

function! UnComment()
    exe line("'<")."normal dd" | exe line("'>")."normal dd"   
endfunction

function! SoftWrap()
    let s:old_fo = &formatoptions
    let s:old_tw = &textwidth
    set fo=
    set tw=999999 " works for paragraphs up to 12k lines
    normal gggqG
    let &fo = s:old_fo
    let &tw = s:old_tw
endfunction

"Custom Key-bindings

let mapleader = " "

nnoremap <leader>w :w<cr>
nnoremap <leader>s :wq<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>so :so %<cr>
nnoremap <leader>y <Esc>"+y
nnoremap <leader>p <Esc>"+p

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :w<cr>:so %<cr>:q<cr>
nnoremap <leader>b :!%<CR>
nnoremap <leader>gq :call SoftWrap<cr>


nnoremap cpf i#include "iostream"<Esc>ousing namespace std;<Esc>o<CR>int main(){<Esc>o<Esc>oreturn 0;<Esc>o}<Esc>kki
nnoremap cf i#include<stdio.h><Esc>oint main(){<Esc>o<Esc>oreturn 0;<Esc>o}<Esc>kki<Tab>
nnoremap cpp :!c++ % -o %:r && %:r<CR>
nnoremap c, :!gcc % -o %:r && %:r<CR>
nnoremap py :!python %<cr>
nnoremap sh :!bash %<CR>
nnoremap cd :cd .. <bar> cd .. <bar> cd d:\meet\Code <CR>
nnoremap cg :cd .. <bar> cd .. <bar> cd d:\meet\College\SY-SEM-3<CR>
nnoremap <C-n> :NERDTree<CR><c-w><<c-w><<c-w><<c-w><
nnoremap <C-t> :term<CR><C-w><C-r><C-w>-<C-w>-<C-w>-<C-w>-<C-w>-
nnoremap <C-B> :term bash<CR><C-w><C-r><C-w>-<C-w>-<C-w>-
nnoremap ,j :!javac % && java %:r<CR>
nnoremap <C-j> ipublic class <ESC>"%pxxxxxa {<ESC>opublic static void main(String args[]){<Esc>o<Esc>o}<Esc>o}<Esc>kki<Tab><Tab>
nnoremap ,k i---<ESC>olayout: post<ESC>otitle : ""<ESC>osubtitle: ""<ESC>odate: 2021-00-00 15:00:00 +0530<ESC>ocategories: []<ESC>oimage: /assets/img/.png<ESC>o---<ESC>6kt"a

vnoremap ,m :<c-w><c-w><c-w><c-w><c-w>call Comment()<CR>
vnoremap m, :<c-w><c-w><c-w><c-w><c-w>call UnComment()<CR>

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'mattn/emmet-vim'
Plugin 'preservim/nerdtree'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'vim-airline/vim-airline'
Plugin 'vim-scripts/AutoComplPop'
Plugin 'evanleck/vim-svelte', {'branch': 'main'}
Plugin 'gabrielelana/vim-markdown'

call vundle#end()            
filetype plugin indent on

set encoding=UTF-8
"packadd! dracula
syntax enable
colorscheme dracula
set go=c
set wildmode=longest,list,full
set wildmenu
hi Directory guifg=#57dbff ctermfg=green

"autocmd CursorHold,CursorHoldI * call NERDTreeFocus() | call g:NERDTree.ForCurrentTab().getRoot().refresh() | call g:NERDTree.ForCurrentTab().render() | wincmd w
autocmd BufEnter NERD_tree_* | execute 'normal R'
au CursorHold * if exists("t:NerdTreeBufName") | call <SNR>15_refreshRoot() | endif

"autocmd VimEnter * NERDTree

augroup DIRCHANGE
    au!
    autocmd DirChanged global :NERDTreeCWD
augroup END

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
set autoread
