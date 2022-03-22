set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

set encoding=utf-8
set number relativenumber

"set termguicolors
"source ~/.vimrc

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'chriskempson/base16-vim'

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'honza/vim-snippets'
Plug 'andrewstuart/vim-kubernetes'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'tridactyl/vim-tridactyl'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'j-hui/fidget.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'stevearc/aerial.nvim'

call plug#end()

let base16colorspace=256
colorscheme base16-solarized-dark

let mapleader="\<Space>"

"vnoremap jk <ESC>
inoremap jk <ESC>
inoremap Jk <ESC>
inoremap jK <ESC>
inoremap JK <ESC>
tnoremap jk <ESC>

noremap <leader>l <C-w>l
noremap <leader>h <C-w>h
noremap <leader>k <C-w>k
noremap <leader>j <C-w>j
tnoremap <leader>l <C-w>l
tnoremap <leader>h <C-w>h
tnoremap <leader>k <C-w>k
tnoremap <leader>j <C-w>j

"nnoremap <leader>a :cclose<CR>

" indent without killing the selection in VISUAL mode
vmap < <gv
vmap > >gv

" Move selected text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 100)

set completeopt=menu,menuone,noselect

set incsearch hlsearch ignorecase smartcase

set expandtab tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set wildmode=longest,list,full
set wildmenu

set scrolloff=5 " Keep 5 lines between cursor and top of screen
set showcmd " display incomplete commands

autocmd FileType perl set expandtab tabstop=4 shiftwidth=4 softtabstop=4

set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

let g:UltiSnipsSnippetDirectories=['UltiSnips', 'mysnippets']
let g:UltiSnipsExpandTrigger='<leader><tab>'
let g:UltiSnipsJumpForwardTrigger='<leader><tab>'
let g:UltiSnipsJumpBackwardTrigger='<leader><S-tab>'

nnoremap <leader>tt <cmd>Telescope<cr>
nnoremap <leader>tf <cmd>Telescope git_files<cr>
nnoremap <leader>tg <cmd>Telescope live_grep<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>
nnoremap <leader>tca <cmd>Telescope lsp_code_actions<cr>

autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

lua require('init')
