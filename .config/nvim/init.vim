set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

set encoding=utf-8
set number relativenumber

"set termguicolors
"source ~/.vimrc

call plug#begin('~/.vim/plugged')

"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lualine/lualine.nvim'
Plug 'RRethy/nvim-base16'

"Plug 'chriskempson/base16-vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter-context'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/nvim-cmp'

Plug 'editorconfig/editorconfig-vim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'

"  Snippets
Plug 'L3MON4D3/LuaSnip'             " Required
Plug 'rafamadriz/friendly-snippets' " Optional

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'tridactyl/vim-tridactyl'

Plug 'nvim-tree/nvim-web-devicons'
"Plug 'ryanoasis/vim-devicons'

Plug 'nvim-tree/nvim-tree.lua'
Plug 'stevearc/aerial.nvim'

Plug 'folke/trouble.nvim'
call plug#end()

let base16colorspace=256
colorscheme base16-solarized-dark

let mapleader="\<Space>"

noremap <C-f> <C-f>zz
noremap <C-b> <C-b>zz

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

tnoremap <ESC> <C-\><C-n>
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

" press <Tab> to expand or jump in a snippet. These can also be mapped separately
" via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

set completeopt=menu,menuone,noselect

set incsearch hlsearch ignorecase smartcase

set expandtab tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set wildmode=longest,list,full
set wildmenu

set scrolloff=5 " Keep 5 lines between cursor and top of screen
set showcmd " display incomplete commands

set splitbelow " Open splits below instead of up
set splitright " Open splits on the right

autocmd FileType perl set expandtab tabstop=4 shiftwidth=4 softtabstop=4

set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

let g:UltiSnipsSnippetDirectories=['UltiSnips', 'mysnippets']
let g:UltiSnipsExpandTrigger='<leader><tab>'
let g:UltiSnipsJumpForwardTrigger='<leader><tab>'
let g:UltiSnipsJumpBackwardTrigger='<leader><S-tab>'

nnoremap <leader>tt <cmd>Telescope<cr>
nnoremap <leader>tg <cmd>Telescope git_files<cr>
nnoremap <leader>tf <cmd>Telescope find_files<cr>
nnoremap <leader>t/ <cmd>Telescope live_grep<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>tr <cmd>Telescope registers<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>
nnoremap <leader>tca <cmd>Telescope lsp_code_actions<cr>

nnoremap <leader>gb <cmd>Gitsigns blame_line<cr>
nnoremap <leader>gn <cmd>Gitsigns next_hunk<cr>
nnoremap <leader>gp <cmd>Gitsigns prev_hunk<cr>
nnoremap <leader>gk <cmd>Gitsigns preview_hunk<cr>

inoremap <C-r> <cmd>Telescope registers<cr>

autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

nnoremap <leader>xx <cmd>TroubleToggle<cr>

nmap <leader>n :tab drop term://zsh<CR>
autocmd TermOpen * set number! relativenumber!

lua require('init')


