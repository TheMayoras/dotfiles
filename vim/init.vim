" Fish shell doesn't work very well
set shell=/bin/bash

set nocompatible
filetype off
set rtp+=~/dev/Software/Rust/base16-builder-rust/templates/vim
call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'tpope/vim-fugitive', {  'tag': 'v2.3' }
Plug 'kshenoy/vim-signature'
Plug 'airblade/vim-gitgutter'
Plug 'simnalamburt/vim-mundo' " History Tree Viewer

"Color Schemes
Plug 'rafi/awesome-vim-colorschemes'
Plug 'nightsense/vimspectr'

" Language Client
Plug 'autozimu/LanguageClient-neovim', {
	\ 'do': 'bash install.sh',
	\ 'branch': 'next'
	\}
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'sheerun/vim-polyglot' " JS + extra

Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'dag/vim-fish'

call plug#end()

" GUI Settings
set number
set relativenumber
set ruler
set showcmd
set mouse=a
set wrapscan
set autoindent
set timeoutlen=300
set encoding=utf-8
set scrolloff=2
set noshowmode
set hidden
set foldenable
set foldmethod=indent
" set nowrap
set nojoinspaces
set lazyredraw
set guioptions-=T
let mapleader=","

" default splits to right or bottom
set splitright
set splitbelow

set autoindent
set shortmess+=c " don't give |ins-completion-menu| messages.

set diffopt+=iwhite " No whitespace in vimdiff

filetype plugin indent on

" Allow undoing after closing
set undodir=~/.vimdid
set undofile

" Searching functions
set incsearch
set ignorecase
set smartcase
set gdefault

syntax on

" Support python
let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'

" ========================
" COLORSCHEME
" ======================== 
" Plugin settings
let g:secure_modelines_allowed_items = [
                \ "textwidth",   "tw",
                \ "softtabstop", "sts",
                \ "tabstop",     "ts",
                \ "shiftwidth",  "sw",
                \ "expandtab",   "et",   "noexpandtab", "noet",
                \ "filetype",    "ft",
                \ "foldmethod",  "fdm",
                \ "readonly",    "ro",   "noreadonly", "noro",
                \ "rightleft",   "rl",   "norightleft", "norl",
                \ "colorcolumn"
                \ ]

 if (match($TERM, "-256color") != -1) && (match($TERM, "screen-256color") == -1)
   " screen does not (yet) support truecolor
   set termguicolors
 endif

" color scheme
colorscheme OceanicNext

hi Normal ctermbg=NONE
" Language Server Stuff
let g:LanguageClient_serverCommands = {
	\ 'rust': [ 'rustup', 'run', 'stable', 'rls' ],
	\ 'python': [ '/usr/bin/pyls'],
	\ }
" Automatically start language servers.
let g:LanguageClient_autoStart=1
let g:deoplete#enable_at_startup=1
set cmdheight=2
set updatetime=500

" ==========================
" LIGHTLINE
" ==========================

let g:lightline = {
	\ 'component': {
	\   'lineinfo': ' %3l:%-2v',
	\ },
	\ 'component_function': {
	\   'readonly': 'LightlineReadonly',
	\   'filename': 'LightlineFilename',
	\   'fugitive': 'LightlineFugitive',
	\ },
	\ 'active': {
	\     'left': [ [ 'mode', 'paste' ],
	\             [ 'fugitive', 'git-status', 'filename', 'modified', 'readonly' ] ]
	\ },
	\ 'separator': { 'left': '', 'right': '' },
	\ 'subseparator': { 'left': '', 'right': '' }
	\ }
function! LightlineReadonly()
	return &readonly ? 'R' : ''
endfunction
function! LightlineFugitive()
	if exists('*fugitive#head()')
		let branch = fugitive#head()
		return branch !=# '' ? ' '.branch : ''
	endif
	return ''
endfunction
function! LightlineFilename()
	return expand('%:t') !=# '' ? @% : '[NoName]'
endfunction
set noshowmode

" ==========================
" VIM ROOTER and FZF
" ==========================
let g:fzf_layout = { 'down': '~20%' }

function! s:list_cmd()
  let base = fnamemodify(expand('%'), ':h:.:S')
  return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', shellescape(expand('%')))
endfunction

" command! -bang -nargs=? -complete=dir Files
"   \ call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
"   \                               'options': '--tiebreak=index'}, <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" ========================
" COMPLETION
" =======================
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-.> to trigger completion.
inoremap <silent><expr> <c-.> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Disable ALE auto completion
let g:ale_completion_enabled=0
let g:ale_set_highlights = 0
" hi! link CocWarningHighlight SignColumn 
" hi! link CocErrorHighlght SignColumn



" ============================================
" KEYBOARD SHORTCUTS
" ============================================

" Working with split panes better
"
" switch between panes
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l



" Search results centering
nnoremap <silent> n nzz
nnoremap <silent> N Nzz

" No Arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap <C-n> :nohl<CR> " get rid of search highlighting

" Remap CTRL+j to ESC
inoremap <C-j> <ESC>

" Making new Splits
nnoremap <M-n> <C-W><C-N>
nnoremap <M-v> <C-W><C-V>

" Max out splits
nnoremap <C-\> <C-W>|
nnoremap <C-_> <C-W>_

" Count a wrapped line as a line
nnoremap j gj
nnoremap k gk

" FZF hotkeys
nnoremap <leader>f :Files<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>

nmap <silent> E <Plug>(coc-diagnostic-prev)
nmap <silent> W <Plug>(coc-diagnostic-next)
nmap <silent> <C-I> <Plug>(coc-diagnostic-info)  
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gd :call LanguageClient#textDocument_definition()<CR>
noremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Rust stuff
" Sett rls.booya.wtf/#neovim
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:furstfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'
let $RUST_SRC_PATH = systemlist("rustc --print sysroot")[0] . "/lib/rustlib/src/rust/src"
autocmd BufReadPost *.rs setlocal filetype=rust

" =====================================
" Auto Commands
" =====================================
" Follow Rust code style rules
au Filetype rust source ~/.config/nvim/scripts/spacetab.vim
au Filetype rust set colorcolumn=150

" Latex Filetypes
au Filetype *.tex setlocal filetype=tex
