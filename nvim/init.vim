set clipboard+=unnamedplus
set encoding=UTF-8

set number
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set scrolloff=8
set noswapfile
set expandtab

call plug#begin()

Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/morhetz/gruvbox'

Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/tpope/vim-commentary'

Plug 'https://github.com/neoclide/coc.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim'

call plug#end()

let NERDTreeShowHidden=1

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

colorscheme gruvbox

nnoremap <C-q> :q! <cr>
nnoremap <C-s> :w! <cr>

nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent><S-t> :tabnew <cr>

nnoremap <F5> :NERDTreeToggle <cr>

nnoremap ff <cmd> Telescope find_files <cr>
nnoremap fg <cmd> Telescope live_grep <cr>

inoremap <expr><cr> coc#pum#visible() ? coc#pum#confirm() : "\<cr>"
