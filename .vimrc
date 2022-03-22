" vim:set foldmethod=marker foldlevel=0:
" This modeline  folds the different vimrc sections
set encoding=utf-8
scriptencoding utf-8

filetype plugin on
filetype indent on
syntax on

if &term =~# '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
    set t_Co=256
endif

colorscheme torte

set modeline
set modelines=1

set scrolloff=5 " Keep 5 lines between cursor and top of screen

set history=200   " keep 200 lines of command line history
set showcmd   " display incomplete commands

" Avoid clutter
set nobackup             " don't keep backup files
set directory=~/.vim/tmp " put swap files somewhere else
if !isdirectory(&directory)
    call mkdir(&directory, 'p')
endif

" Restore cursor from last edit position, except on git commit
" from: https://github.com/vim/vim/blob/master/runtime/defaults.vim
augroup vimStartup
  au!
  autocmd BufReadPost *
   \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
   \ |   exe "normal! g`\""
   \ | endif
augroup END

" Autoclose quifix window if last window
aug QFClose
  au!
  au WinEnter * ++nested if winnr('$') == 1 && &buftype == "quickfix"  | q|endif
aug END

" Spaces & Tabs {{{
set expandtab tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
"set list
" }}}
" UI Layout {{{
set number
set wildmenu
"set cursorline
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
" Plugin Config {{{
let g:airline#extensions#tabline#enabled = 1

" ale linter
let g:ale_completion_enabled = 0

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%]% (code) :% %s [%severity%]'

let g:ale_javascript_eslint_use_global = 1
let g:ale_javascript_eslint_executable = 'yarn'
let g:ale_javascript_eslint_options = 'run eslint'

let g:ale_python_black_use_global = 1
let g:ale_python_black_options = '--line-length 120'
let g:ale_python_flake8_options = '--max-line-length 120'
let g:ale_python_pylint_options = '--max-line-length 120'
let g:ale_markdown_mdl_options = '--rules "~MD013"'
let g:ale_set_balloons = 1

let g:ale_perl_perlcritic_options = '-1'
let g:ale_perl_perlcritic_showrules = 1
let g:ale_perl_perltidy_options = ''

let g:ale_linters = {
\   'python': ['mypy', 'pyls', 'pyflakes', 'flake8', 'bandit', 'pylint'],
\   'lua': ['luac', 'luacheck'],
\   'go': ['gofmt', 'golint', 'govet'],
\   'typescript': ['eslint', 'tsserver'],
\   'c' : ['clangd'],
\   'markdown': ['mdl'],
\   'perl': ['perl', 'perlcritic'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'reorder-python-imports'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint', 'prettier'],
\   'typescript.tsx': ['eslint', 'prettier'],
\   'sh': ['shfmt'],
\   'perl': ['perltidy'],
\}

" autocompletion
set completeopt=menu,menuone,noselect,noinsert
set updatetime=800

let g:ycm_add_popup_to_completeopt = 1
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0

let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<C-j>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>', '<C-k>']

let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
"
let g:ycm_rust_src_path = '/home/gfeun/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
let g:ycm_filetype_blacklist = {}
let g:ycm_filetype_specific_completion_to_disable = {
      \ 'gitcommit': 1,
      \ 'go': 1,
      \}

let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = [
      \ '/home/gfeun/.local/lib/',
      \]
let g:ycm_extra_conf_vim_data = [
      \  'g:ycm_python_interpreter_path',
      \  'g:ycm_python_sys_path'
      \]
let g:ycm_global_ycm_extra_conf = '~/.vim/global_extra_conf.py'

" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath('clangd')


let g:go_doc_popup_window = 1
let g:go_list_type = 'quickfix'
let g:go_term_enabled = 1
let g:go_term_reuse = 1
let g:go_term_mode = 'split'
let g:go_term_height = 10
let g:go_term_width = 30

let g:go_auto_sameids = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_fmt_experimental = 1
let g:go_fmt_command = 'goimports'

let g:openbrowser_default_search = 'duckduckgo'

" vim wiki
let g:vimwiki_list = [
\ {'path': '~/til/', 'index': 'README', 'path_html': '~/til/html', 'syntax': 'markdown', 'ext': '.md'},
\ {'path': '~/orga/', 'index': 'okr', 'path_html': '~/orga/html', 'syntax': 'markdown', 'ext': '.md'}
\]

" turn off temporary wiki
let g:vimwiki_global_ext = 0

let g:vimwiki_url_maxsave = 0

augroup markdownGroup
  au!
  autocmd Filetype markdown UltiSnipsAddFiletypes vimwiki
  autocmd Filetype markdown let g:ale_lint_on_text_changed='never'
  autocmd Filetype markdown let g:ale_lint_on_insert_leave = 0
augroup END

let g:vimwiki_table_mappings = 0

" Snippets
let g:UltiSnipsSnippetDirectories=['UltiSnips', 'mysnippets']
let g:UltiSnipsExpandTrigger='<leader><tab>'
let g:UltiSnipsJumpForwardTrigger='<leader><tab>'
let g:UltiSnipsJumpBackwardTrigger='<leader><S-tab>'

" Prevent indentlines to set conceallevel https://vi.stackexchange.com/questions/7258/how-do-i-prevent-vim-from-hiding-symbols-in-markdown-and-json

" }}}
"
" Mappings {{{
let mapleader="\<Space>"
inoremap jk <ESC>
tnoremap jk <ESC>

" Tabs management
nnoremap <leader>tp :tabprevious<CR>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tc :tabclose<CR>
tnoremap <leader>tp :tabprevious<CR>
tnoremap <leader>tn :tabnext<CR>
tnoremap <leader>tc :tabclose<CR>

" Window movement
noremap <leader>l <C-w>l
noremap <leader>h <C-w>h
noremap <leader>k <C-w>k
noremap <leader>j <C-w>j
tnoremap <leader>l <C-w>l
tnoremap <leader>h <C-w>h
tnoremap <leader>k <C-w>k
tnoremap <leader>j <C-w>j

" Clipboard
noremap <leader>s "+
vnoremap <leader>s "+

" Manual indentation
nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>

" youcompleteme
nnoremap <leader>yt :YcmCompleter GetType<CR>
nnoremap <leader>yg :YcmCompleter GoTo<CR>
nnoremap <leader>yd :YcmCompleter GetDoc<CR>
nnoremap <leader>yr :YcmCompleter RefactorRename <C-r><C-w><space>

" Ale diagnostics
noremap <silent> <C-n> :ALENext<CR>
noremap <silent> <C-p> :ALEPrevious<CR>
nnoremap <leader>a :cclose<CR>

" fzf preview window when using Files command
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

nnoremap <leader>F :Files<CR>
nnoremap <leader>B :Buffers<CR>
" Command history
nnoremap <leader>H :History:<CR>
" Search history
nnoremap <leader>S :History/<CR>

nmap <C-k> <C-u>zz " go up half screen and center cursor
nmap <C-j> <C-f>zz " go down half screen and center cursor

noremap <leader>s <plug>(openbrowser-smart-search)

" Generic Makefile based build/run/test
noremap <leader>b :make build<CR>
noremap <leader>r :make run<CR>
noremap <leader>t :make test<CR>

" Language specific bindings for build/run/test/*
" Go
augroup goGroup
  au!
  autocmd FileType go noremap <buffer> <leader>b :GoBuild<CR>
  autocmd FileType go noremap <buffer> <leader>r :GoRun<CR>
  autocmd FileType go noremap <buffer> <leader>t :GoTest<CR>
  autocmd FileType go noremap <buffer> <leader>d :GoDebugStart<CR>
  autocmd FileType go nnoremap <buffer> <leader>g :GoDef<CR>
  autocmd FileType go nmap <Leader>i <Plug>(go-info)
augroup END

" Python
augroup pythonGroup
  au!
  autocmd Filetype python nnoremap <buffer> <leader>r :exec '!python3' shellescape(@%, 1)<CR>
  autocmd Filetype python nnoremap <buffer> <leader>t :exec '!pytest'<CR>
augroup END

" Shell
augroup shellGroup
  au!
  " Open a new vsplit window, exec current file in a bash shell and follow output
  autocmd Filetype sh nnoremap <buffer> <leader>r :vsplit <bar> :term bash % <CR> <bar> :normal G <CR>
augroup END

" }}}
" Vim Plug {{{
call plug#begin('~/.vim/plugged')
" General purpose
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'tyru/open-browser.vim'
Plug 'Valloric/YouCompleteMe', { 'dir': '~/.vim/plugged/YouCompleteMe', 'do': 'python3 install.py --ts-completer --rust-completer --clang-completer --clang-completer' }
Plug 'junegunn/vim-peekaboo'
Plug 'gyim/vim-boxdraw'

" Language support
Plug 'fatih/vim-go', { 'for' : 'go', 'do': ':GoUpdateBinaries' }
Plug 'rust-lang/rust.vim', { 'for' : 'rust' }
Plug 'hashivim/vim-terraform'
Plug 'vimwiki/vimwiki', {'tag': '*'}
Plug 'posva/vim-vue'
Plug 'ianks/vim-tsx'

" Stripped down Markdown config
Plug 'junegunn/goyo.vim'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'andrewstuart/vim-kubernetes'

" Themes
"Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='simple'
Plug 'tomasiser/vim-code-dark'
"Plug 'altercation/vim-colors-solarized'

" load last
Plug 'ryanoasis/vim-devicons'

"Plug 'neovim/nvim-lspconfig'

call plug#end()
" }}}
