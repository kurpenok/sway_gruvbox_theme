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

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/neoclide/coc.nvim'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'

call plug#end()

source ~/.local/share/nvim/plugged/awesome-vim-colorschemes/colors/gruvbox.vim
