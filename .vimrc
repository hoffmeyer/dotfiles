" Removes top bar in macvim and gvim
if has("gui_running")
set guioptions-=T
set guioptions-=m
set guioptions-=r
endif

syntax enable

set encoding=utf-8

" solarized colortheme settings
set background=dark
colorscheme solarized
filetype plugin indent on

" vim-airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" enable line numbers
set nu

" allow buffer switch when current buffer is not saved
:set hidden

" set tabs to display as two spaces
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" ctrl-p settings
let g:ctrlp_custom_ignore = '\v[\/](dist|node_modules|bower_components)$'

" syntastic settings
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

" nerdTree settings
map <C-n> :NERDTreeToggle<CR>

" keyboard mappings
let mapleader = " "
nnoremap <leader>l :ls<cr>:b<space>
map <leader>n :bn<cr>
map <leader>p :bp<cr>
map <leader>d :bd<cr>  
map <leader>r :e<cr>
map <leader>v :e ~/.vimrc<enter>
map <leader>i :e app/main.html<enter>
map <leader>o <C-p>
inoremap (; ();<Esc>hi
inoremap {<CR> {<CR>}<Esc><S-o>


"map ctrl-s to save file
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" vundle stuff
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
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'airblade/vim-gitgutter'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'pangloss/vim-javascript'
Bundle 'tpope/vim-sensible'
Bundle 'mattn/emmet-vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'marijnh/tern_for_vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'

" vim-scripts repos
"Bundle 'L9'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (ie. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

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
