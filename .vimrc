set number
set nowrap
syntax on
set showcmd
filetype indent on
set nocompatible
set noundofile
set noswapfile
set nobackup
set nobk nowb noswf noudf
filetype off


set backupdir=$HOME/.vim/backup     "directory where the undo files will be stored
if has('persistent_undo')         "check if your vim version supports
  set undodir=$HOME/.vim/undo     "directory where the undo files will be stored
  set undofile                    "turn on the feature
  set noundofile
  set noswapfile
  set nobackup
  set nobk nowb noswf noudf
endif


"Custom Key-bindings

nnoremap cpf i#include<iostream><Esc>ousing namespace std;<Esc>o<CR>int main(){<Esc>o<Esc>oreturn 0;<Esc>o}<Esc>kki
nnoremap cf i#include<stdio.h><Esc>oint main(){<Esc>o<Esc>oreturn 0;<Esc>o}<Esc>kki<Tab>
nnoremap cpp :!c++ % -o %:r && %:r<CR>
nnoremap c, :!gcc % -o %:r && %:r<CR>
nnoremap py :python %<cr>
nnoremap sh :!bash %<CR>
nnoremap cd :cd .. <bar> cd .. <bar> cd D:\meet\Code <CR>
nnoremap cg :cd .. <bar> cd .. <bar> cd D:\meet\College\SY-SEM-3<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :term<CR><C-w><C-r><C-w>-<C-w>-<C-w>-<C-w>-<C-w>-
noremap <C-b> :term bash<CR><C-w><C-r><C-w>-<C-w>-<C-w>-
nnoremap ,j :!javac % && java %:r<CR>
nnoremap <C-j> ipublic class <ESC>"%pxxxxxa {<ESC>opublic static void main(String args[]){<Esc>o<Esc>o}<Esc>o}<Esc>kki<Tab><Tab>
nnoremap ,k i---<ESC>olayout: post<ESC>otitle : ""<ESC>osubtitle: ""<ESC>odate: 2021- 15:00:00 +0530<ESC>ocategories: []<ESC>oimage: /assets/img/.png<ESC>o---<ESC>6kt"a

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'mattn/emmet-vim'
Plugin 'preservim/nerdtree'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'vim-airline/vim-airline'
Plugin 'vim-scripts/AutoComplPop'

call vundle#end()            
filetype plugin indent on
set bg=dark

packadd! dracula
syntax enable
colorscheme dracula
set go=c
set wildmode=longest,list,full
set wildmenu

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
" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
  set diffexpr=MyDiff()
endif
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &sellxquote=l:shxq_sav
  endif
endfunction

