" gf
"
set nocompatible
syntax on
filetype plugin on
"Enable modeline {{{
set modeline
set modelines=5
"}}}
" Spaces & Tabs {{{
set expandtab
set tabstop=2
set shiftwidth=2
filetype plugin on
filetype indent on
set autoindent
set modelines=1

autocmd Filetype lua setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
" }}}
" UI Layout {{{
set number
set encoding=utf-8
set wildmenu
set cursorline
" }}}
" Searching {{{
set ignorecase
set incsearch
set nohlsearch
set wildmode=longest,list,full
set wildmenu
" }}}
" Folding {{{
"=== folding ===
set foldenable
set foldmethod=indent
set foldnestmax=10
set foldlevelstart=10
" }}}
" Leader {{{
let mapleader="\<Space>"
inoremap jk <ESC>

noremap <leader>b :make build<CR>
noremap <leader>r :make run<CR>
noremap <leader>t :make test<CR>

noremap <leader>l <C-w>l
noremap <leader>h <C-w>h
noremap <leader>k <C-w>k
noremap <leader>j <C-w>j

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

autocmd FileType go noremap <buffer> <leader>b :GoBuild<CR>
autocmd FileType go noremap <buffer> <leader>r :GoRun<CR>
autocmd FileType go noremap <buffer> <leader>t :GoTest<CR>
autocmd FileType go noremap <buffer> <leader>d :GoDebugStart<CR>

nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<CR>

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" }}}
" Vim Plug {{{
call plug#begin('~/.vim/plugged')
" General purpose
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'psf/black', { 'for' : 'python' }
Plug 'w0rp/ale'
Plug 'tyru/open-browser.vim'
Plug 'Valloric/YouCompleteMe', { 'dir': '~/.vim/plugged/YouCompleteMe', 'do': 'python3 install.py --ts-completer --rust-completer --clang-completer' }
Plug 'junegunn/vim-peekaboo'
Plug 'gyim/vim-boxdraw'

" Language support
Plug 'fatih/vim-go', { 'for' : 'go', 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim', { 'for' : 'rust' }
Plug 'hashivim/vim-terraform'
"Plug 'vimwiki/vimwiki'
Plug 'VelkyVenik/vim-avr'
Plug 'IN3D/vim-raml'
Plug 'posva/vim-vue'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Themes
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
Plug 'altercation/vim-colors-solarized'

call plug#end()
" }}}
" Plugin Specifics {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1
let g:ale_python_black_use_global = 1
let g:ale_go_golangci_lint_package = 1
let g:ale_linters = {
\   'python': ['black'],
\   'lua': ["luac", "luacheck"],
\   'go': ["golangci"]
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}

let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_python_binary_path = 'python'
let g:ycm_rust_src_path = '/home/dev/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
let g:ycm_global_ycm_extra_conf = '~/.global_extra_conf.py'
let g:ycm_filetype_specific_completion_to_disable = {
      \ 'gitcommit': 1,
      \}

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
"let g:go_metalinter_autosave = 1
let g:go_auto_type_info = 1
"let g:go_auto_sameids = 1

" Enable 256 color support
set t_Co=256
set t_ut=
"let g:airline_theme = 'base16_eighties'

let g:openbrowser_default_search = 'duckduckgo'
nmap <leader>s <plug>(openbrowser-smart-search)
vmap <leader>s <plug>(openbrowser-smart-search)

" vim wiki
let g:vimwiki_list = [{'path': '~/orga/wiki', 'path_html': '~/orga/wiki/html', 'syntax': 'markdown', 'ext': '.vmd'}]
let g:vimwiki_url_maxsave = 0

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-i> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nmap <leader>f :Files<CR>
" fzf preview window when using Files command
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Snippets
let g:UltiSnipsExpandTrigger="<leader><tab>"

let g:markdown_syntax_conceal = 0
let g:markdown_folding = 1
" }}}
"
"
"

" vim:set foldmethod=marker foldlevel=0:
