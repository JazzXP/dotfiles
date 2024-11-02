set relativenumber
set nu
set laststatus=2
set ru
syntax on
colorscheme desert
set tabstop=2
filetype plugin indent on
set expandtab
set shiftwidth=2
set backspace=indent,eol,start
set encoding=UTF-8
set smarttab
set autoindent
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch

" Install and run vim-plug on first run
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    silent !touch ~/.vim/plugins.vim
endif

so ~/.vim/plugins.vim

if !has('gui_running')
  set t_Co=256
endif
set noshowmode

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-o> :NERDTreeToggle<CR>

