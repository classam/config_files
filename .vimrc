" Warning! This .vimrc won't work until you perform the following steps:
"   1. git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"   2. boot up vim
"   3. :PluginInstall

set nocompatible              " be iMproved, required
filetype off                  " required

" VUNDLE HO
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
" adds git integration:
"  :Gstatus
"  :Gdiff
"  :Gmove
"  :Ggrep
"  :Git
"  :Gblame
Plugin 'scrooloose/nerdtree'
" Replaces the default file explorer with a much better file explorer
Plugin 'tpope/vim-surround'
" adds 'surround' features
"  cs"' (change surrounding " to ')
"  cs'<q> (change surrounding ' to <q></q>
"  cst" (change surrounding <q> to ")
"  ds" (delete surrounding ")
"  ysiw] (add [surrounding] in word)
"  ysiw<em> (add <em>surrounding</em> in word)
"  use visual mode to select some space, then hit S" to surround that space in
"       quotes
Plugin 'bling/vim-airline'
"  Add bling to the line along the bottom of the page
"   if you have fugitive installed, will display the current branch
Plugin 'pangloss/vim-javascript'
"  Improved Javascript handling in vim
Plugin 'mileszs/ack.vim'
"  Add ack to vim. (Make sure ack is installed)
"  :Ack <whatevs>

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Launch vim and run :PluginInstall

" If we just open vim on it's own, activate the NERD Tree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" If the only window left open is a NERD Tree, close it
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Turn on airline tabs
let g:airline#extensions#tabline#enabled = 1
" And make sure airline shows up right away
set laststatus=2

" Guess the correct indentation level
set autoindent
set smartindent

" Always use four spaces instead of tabs
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

autocmd FileType javascript set tabstop=2|set softtabstop=2|set shiftwidth=2

" Show matching braces
set showmatch

" Tell me where the cursor is.
set ruler

" Incremental search, ignore case-sensitivity
set incsearch
set ignorecase
set smartcase

" Pretty, pretty slate
set background=dark
colorscheme slate

" Friggin vim swapfiles all over the damn place.
set noswapfile

syntax enable

" In GVIM, hide the toolbar, show horizontal scrolling.
set guioptions-=T
set guioptions+=b
set nowrap

" If you're using MacVim and want a nice font
set gfn=Inconsolata:h18

set mouse=a

" Kill trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Always treat .md files as Markdown, not Modula2
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
