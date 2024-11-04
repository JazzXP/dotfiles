set relativenumber
set nu
set laststatus=2
syntax on
set tabstop=2
filetype plugin indent on
set expandtab
set shiftwidth=2
set backspace=indent,eol,start
set encoding=UTF-8
set showmatch

call plug#begin()
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'nvim-tree/nvim-web-devicons'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
call plug#end()

autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

map <C-o> :NERDTreeToggle<CR>
