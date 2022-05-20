set encoding=UTF-8

:set number
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set scrolloff=8
:set noswapfile
:set expandtab

call plug#begin()

Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/ap/vim-css-color'

Plug 'https://github.com/tc50cal/vim-terminal'
Plug 'https://github.com/preservim/nerdtree'

Plug 'https://github.com/neoclide/coc.nvim'

call plug#end()

nmap <F4> :Terminal zsh<CR>

nnoremap <C-t> :NERDTreeToggle<CR>

source ~/.local/share/nvim/plugged/awesome-vim-colorschemes/colors/gruvbox.vim

