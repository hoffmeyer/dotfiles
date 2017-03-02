" vim:fdm=marker

" General stuff {{{

" dont try to be compatible with vi (required by vundle)
set nocompatible

" Blink instead of beeping
set visualbell

" Set the leader key
let mapleader = ","

" ignore case when searching
set ignorecase

" be smart about case while searching
set smartcase

"Highlight search results
set hlsearch

" Makes search work like in mordern browsers
set incsearch

" show matching brackets
set showmatch

" How many seconds should the cursor blink when matching brackets
set mat=2

" Set how many lines of history VIM has to remember
set history=700

" Automatically read a file when it has been changed from the outside
set autoread

" Always show the status line
set laststatus=2

" Turn backup off, since most stuff is in Git anyway...
set nobackup
set nowb
set noswapfile

" Source the vimrc file after saving it
augroup sourcing
  autocmd!
  if has('nvim')
    autocmd bufwritepost init.vim source $MYVIMRC
  else
    autocmd bufwritepost .vimrc source $MYVIMRC
  endif
augroup END

" }}}
" Key mappings {{{
":imap ii <Esc>
" }}}
" Plugins {{{

" Load vim-plug
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" Theme
Plug 'altercation/vim-colors-solarized'

" Support bundles
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'vim-scripts/gitignore'

" Bars panels and files
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

" Syntax highligting
Plug 'w0rp/ale'

" tab completion
Plug 'Shougo/neocomplete'

" Allow pane movement to jump out of vim into tmux
Plug 'christoomey/vim-tmux-navigator'

" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
Plug 'mpickering/hlint-refactor-vim', { 'for': 'haskell' }
Plug 'alx741/vim-hindent', { 'for': 'haskell' }

" Add plugins to &runtimepath
call plug#end()

" }}}
" UI {{{

" Turn on syntax hightlighting
syntax enable

" Enable line numbers
set number

" Make line numbers relative
set relativenumber

" Show position in file
set ruler

" Automatically populate powerline fonts for airline plugin
let g:airline_powerline_fonts = 1

" }}}
" Theme {{{
set background=dark
colorscheme solarized
" }}}
" Spaces and tabs {{{

" The number of spaces a tab counts for. How it is visually shown on screen
set tabstop=2

" The number of spaces a tab counts for while editing. How many spaces are inserted when pressing tab, and how many are removed when pressing backspace
set softtabstop=2

" Tabs ARE spaces. Always insert spaces instead of tabs
set expandtab

" }}}
" NERDTree {{{

" Close nerdtree after a file is selected
let NERDTreeQuitOnOpen = 1

function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! ToggleFindNerd()
  if IsNERDTreeOpen()
    exec ':NERDTreeToggle'
  else
    exec ':NERDTreeFind'
  endif
endfunction

" If nerd tree is closed, find current file, if open, close it
nmap <silent> <leader>f <ESC>:call ToggleFindNerd()<CR>
nmap <silent> <leader>F <ESC>:NERDTreeToggle<CR>

" }}}
" Ale {{{
" }}}
" Ghc {{{

map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>
map <silent> th :Hoogle<CR>

" }}}
" Neocomplete {{{
let g:neocomplete#enable_at_startup = 1
" }}}
