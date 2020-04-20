" vim:set foldmethod=marker foldlevel=0:
" This modeline  folds the different vimrc sections

filetype plugin on
set modeline
set modelines=1
set nocompatible
syntax on
set t_Co=256
set t_ut=
set scrolloff=5 " Keep 5 lines between cursor and top of screen

" Avoid clutter
set nobackup             " don't keep backup files
set directory=~/.vim/tmp " put swap files somewhere else
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif

" Autoclose quifix window if last window
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
aug END

" Spaces & Tabs {{{
set expandtab
set tabstop=2
set shiftwidth=2
filetype indent on
set autoindent
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
" Vim Plug {{{
call plug#begin('~/.vim/plugged')
" General purpose
Plug 'vim-airline/vim-airline'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'psf/black', { 'for' : 'python', 'tag': '19.10b0' }
Plug 'w0rp/ale'
Plug 'tyru/open-browser.vim'
Plug 'Valloric/YouCompleteMe', { 'dir': '~/.vim/plugged/YouCompleteMe', 'do': 'python3 install.py --ts-completer --rust-completer --clang-completer' }
Plug 'junegunn/vim-peekaboo'
Plug 'gyim/vim-boxdraw'

" Language support
Plug 'fatih/vim-go', { 'for' : 'go', 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim', { 'for' : 'rust' }
Plug 'hashivim/vim-terraform'
Plug 'vimwiki/vimwiki', {'tag': 'dev'}
Plug 'VelkyVenik/vim-avr'
Plug 'IN3D/vim-raml'
Plug 'posva/vim-vue'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'andrewstuart/vim-kubernetes'

" Themes
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
Plug 'altercation/vim-colors-solarized'

call plug#end()
" }}}
" Plugin Config {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

" ale linter
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1
let g:ale_python_black_use_global = 1
let g:ale_linters = {
\   'python': ['black'],
\   'lua': ["luac", "luacheck"],
\   'go': ["gofmt", "golint"]
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black'],
\   'javascript': ['eslint'],
\}

" autocompletion
let g:ycm_autoclose_preview_window_after_insertion = 1
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

let g:openbrowser_default_search = 'duckduckgo'

" vim wiki
let g:vimwiki_list = [{'path': '~/til/', 'index': 'README', 'path_html': '~/til/html', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_url_maxsave = 0

" fzf preview window when using Files command
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Snippets
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><S-tab>"

let g:markdown_syntax_conceal = 0
let g:markdown_folding = 1
" }}}
" Mappings {{{
let mapleader="\<Space>"
inoremap jk <ESC>

noremap <leader>b :make build<CR>
noremap <leader>r :make run<CR>
noremap <leader>t :make test<CR>

noremap <leader>l <C-w>l
noremap <leader>h <C-w>h
noremap <leader>k <C-w>k
noremap <leader>j <C-w>j

noremap <C-n> :cbelow<CR>
noremap <C-p> :cbefore<CR>
nnoremap <leader>a :cclose<CR>

nnoremap <leader>f :Files<CR>

nmap <C-k> <C-u>zz " go up half screen and center cursor
nmap <C-j> <C-f>zz " go down half screen and center cursor

noremap <leader>s <plug>(openbrowser-smart-search)

autocmd FileType go noremap <buffer> <leader>b :GoBuild<CR>
autocmd FileType go noremap <buffer> <leader>r :GoRun<CR>
autocmd FileType go noremap <buffer> <leader>t :GoTest<CR>
autocmd FileType go noremap <buffer> <leader>d :GoDebugStart<CR>

autocmd Filetype python nnoremap <buffer> <leader>r :exec '!python' shellescape(@%, 1)<CR>
autocmd Filetype python nnoremap <buffer> <leader>t :exec '!pytest'<CR>

" }}}
