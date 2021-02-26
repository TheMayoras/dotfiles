" ================================================================================================
" Plugins {{{
" ================================================================================================
filetype off
call plug#begin()

	" =======================================================================
        "     Vim related things (file tree browser, tab stuff, etc.) {{{
	" =======================================================================
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
	Plug 'vim-scripts/TaskList.vim'
	Plug 'simnalamburt/vim-mundo' " History Tree Viewer
        Plug 'justinmk/vim-dirvish'
        Plug 'kien/rainbow_parentheses.vim'  
        Plug 'tpope/vim-obsession'
        Plug 'ryanoasis/vim-devicons'
	" =======================================================================
	" }}}                              
	" =======================================================================

	" =======================================================================
	"                                Color Schemes {{{
	" =======================================================================
	Plug 'nightsense/vimspectr'
	Plug 'drewtempelmeyer/palenight.vim'
        Plug 'limadm/vim-blues'
        Plug 'tjammer/blayu.vim'
        Plug 'petelewis/vim-evolution'
        Plug 'reedes/vim-colors-pencil'
	" =======================================================================
	" }}}                              
	" =======================================================================

	" =======================================================================
        "                             Language Client {{{
	" =======================================================================
	Plug 'rust-lang/rust.vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'cespare/vim-toml'
	Plug 'stephpy/vim-yaml'
	Plug 'dag/vim-fish'
        Plug 'pangloss/vim-javascript'
        Plug 'leafgarland/typescript-vim'
	" =======================================================================
	" }}}                              
	" =======================================================================

	" =======================================================================
        "                             Misc {{{
	" =======================================================================
        " Plug 'arzg/vim-rust-syntax-ext'
	" =======================================================================
	" }}}                              
	" =======================================================================
        
call plug#end()
filetype on

" ================================================================================================
" }}}
" ================================================================================================

" ================================================================================================
" Functions {{{
" ================================================================================================

" Shortcut for checking if a plugin is loaded
function! s:has_plugin(plugin)
  let lookup = 'g:plugs["' . a:plugin . '"]'
  return exists(lookup)
endfunction

" ================================================================================================
" }}}
" ================================================================================================

" ================================================================================================
" Vim Settings {{{
" ================================================================================================

" Fish shell doesn't work very well
set shell=/bin/bash

" I don't care about working with Vi
set nocompatible

" Give me a good number line
set number
set relativenumber
set ruler
set numberwidth=4     " more space for the number column

set showcmd
set mouse=a           " let me use the mouse to move the cursor and scroll
set wrapscan          " searching wraps around to beginning of file
set autoindent        " use indent from previous when pressing Enter
set encoding=utf-8    " who needs ascii?
set scrolloff=2       " give me two lines between the screen and the top
set foldenable        " autofold when opening files
set foldmethod=indent " we usually want to fold by indent
set nowrap            " don't wrap lines
set nojoinspaces      " I don't need two spaces after '.', '?', or '!'
set lazyredraw        " I don't need to see changes from macros until its done (helps with speed)
let mapleader=","     " A good leader key
set expandtab         " makes tabs into spaces
set timeoutlen=1000   " give me a bit longer when typing stuff like '<leader>w'
set colorcolumn=100   " give me a color column (ugly but effective)
set sidescroll=1      " who doesn't want the editor to scroll to the side?

" default splits to right or bottom
set splitright
set splitbelow

set shortmess+=c      " don't give |ins-completion-menu| messages.
set diffopt+=iwhite   " No whitespace in vimdiff

" Allow undoing after closing
set undodir=~/.vimdid
set undofile

set incsearch ignorecase smartcase " Searching functions
set gdefault  " I always want /g for :s commands
syntax on  " who doesn't want syntax highlighting?

" Support python
let g:python_host_prog='/usr/bin/python2'
let g:python3_host_prog='/usr/bin/python3'

set cmdheight=2
set updatetime=500

set noshowmode


" netrw tree mode
let g:netrw_liststyle= 3

" ================================================================================================
" }}}
" ================================================================================================

" ================================================================================================
" Misc {{{
" ================================================================================================

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


" can we use termguicolors
 if match($TERM, "screen-256color") == 0 
         set termguicolors
         let t_Co=256
 endif

" ================================================================================================
" }}}
" ================================================================================================

" ================================================================================================
" Colorscheme {{{
" ================================================================================================
colorscheme base16-blueish
" if s:has_plugin('vim-colors-pencil')
"         colorscheme pencil
" elseif s:has_plugin('vim-blues')
"         colorscheme blues
" elseif s:has_plugin('palenight.vim')
" 	colorscheme palenight
" elseif s:has_plugin('vimspectr')
" 	colorscheme vimspectr210-dark
" else
"         colorscheme desert
" endif

" ================================================================================================
" }}}
" ================================================================================================

" ================================================================================================
" Plugin Settings {{{
" ================================================================================================
"
" ================================================================================================
" Rainbow Brackets {{{
" ================================================================================================
let g:rbpt_colorpairs = [
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'LightPink2'],
    \ ['darkcyan',    'LavenderBlush1'],
    \ ['darkred',     'MintCream'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'LightPink2'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'aquamarine2'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['red',         'RoyalBlue2'],
    \ ]

let g:rbpt_max = 8

" ================================================================================================
" }}}
" ================================================================================================

" ================================================================================================
" Lightline {{{
" ================================================================================================
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
	\ 'subseparator': { 'left': '', 'right': '' },
        \ 'separator': {'left': '', 'right': ''},
        \ 'colorscheme': 'OldHope',
\ }


function! LightlineReadonly()
	return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
	if exists('*fugitive#head()')
		let branch = fugitive#head()
		return branch !=# '🚆' ? ' '.branch : ''
	endif
	return ''
endfunction

function! LightlineFilename()
	return expand('%:t') !=# '' ? WebDevIconsGetFileTypeSymbol() . ' ' . @% : '[NoName]'
endfunction

" ================================================================================================
" }}}
" ================================================================================================

" ================================================================================================
" Vim-Rooter & Fzf {{{
" ================================================================================================
let g:fzf_layout = { 'down': '~20%' }
set grepprg=rg\ --no-heading\ --vimgrep
set grepformat=%f:%l:%c:%m

function! s:list_cmd()
  "let base = fnamemodify(expand('%'), ':h:.:S')
  "echom "Base: " . base
  "return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', shellescape(expand('%')))
  return 'fd --type file --follow'
endfunction

command! -bang -nargs=? -complete=dir Files
   \ call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
   \                               'options': '--tiebreak=index'}, <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Vim-rooter
let g:rooter_targets = '*.yaml,*.yml,*.rs,*.java'
let g:rooter_patterns = ['=package.json', '=Cargo.toml']

" ================================================================================================
" }}}
" ================================================================================================

" ================================================================================================
" Coc & Completion {{{
" ================================================================================================
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

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
nmap <silent> <leader>a :CocAction<CR>
vmap <silent> ga <Plug>(coc-codeaction-selected)
nmap <silent> ga <Plug>(coc-codeaction-selected)W
nmap <silent> ge <Plug>(coc-diagnostic-prev)
nmap <silent> gw <Plug>(coc-diagnostic-next)
nmap <silent> gl <Plug>(coc-diagnostic-info)  
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gu <Plug>(coc-references)
nmap <silent> gr <Plug(coc-rename)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gc <Plug>(coc-refactor)
nmap <silent> gf :<C-u>CocFix<CR>
nmap <silent> <F2> <Plug>(coc-rename)

" navigate problems
nmap <silent> gj <Plug>(coc-diagnostic-next)
nmap <silent> gk <Plug>(coc-diagnostic-prev)

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation() 
        if (index(['vim','help'],&filetype) >= 0)
                execute 'h'.expand('<cword>')
        else
                call CocAction('doHover')
        endif
endfunction

" ================================================================================================
" }}}
" ================================================================================================

" ================================================================================================
" Coc & Completion {{{
" ================================================================================================
let g:dirvish_mode = 2
let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Explore Dirvish <args> " Replace the netrw commands with dirvish
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args> " Replace the netrw commands with dirvish
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args> " Replace the netrw commands with dirvish

" ================================================================================================
" }}}
" ================================================================================================


" javascript 
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow  = 1


" ================================================================================================
" }}}
" ================================================================================================

" ================================================================================================
" Language Settings {{{
" ================================================================================================

" Rust stuff
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:furstfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'
let $RUST_SRC_PATH = systemlist("rustc --print sysroot")[0] . "/lib/rustlib/src/rust/src"

" ================================================================================================
" }}}
" ================================================================================================

" ================================================================================================
" Mappings {{{
" ================================================================================================

" ========================
" Better splits
" ========================
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

" Making new Splits
nnoremap <M-n> <C-W><C-S>
nnoremap <M-m> <C-W><C-V>

" Max out splits
nnoremap <C-\> <C-W>|
nnoremap <C-_> <C-W>_

" incrementally resize splits
nnoremap <silent> <M-a> <C-W><
nnoremap <silent> <M-f> <C-W>>
nnoremap <silent> <M-s> <C-W>-
nnoremap <silent> <M-d> <C-W>+

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

" Get rid of search highlighting
nnoremap <C-n> :nohl<CR>

" Remap CTRL+j to ESC
inoremap <C-j> <ESC>
vnoremap <C-j> <ESC>
xnoremap <C-j> <ESC>

" Count a wrapped line as a line
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" split the current line at the cursor
nnoremap <M-j> i<CR><ESC>
nnoremap <M-k> i<CR><ESC>"-ddk"-P

inoremap jj <ESC>ji
inoremap kk <ESC>ki

" FZF hotkeys
nnoremap <leader>f :Files<CR>
nnoremap <leader>F :exe 'Files '.expand('%:h')<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>r :Rg!<CR>
nnoremap <leader>l :BLines!<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>c :History:<CR>

" Handy stuff
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap E $
vnoremap E $
nnoremap <leader>e :Dirvish<CR>
nnoremap <leader>d :Dirvish %<CR>

" Magic seraching by default
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
cnoremap %s/ %s/\v

" Move a line up or down
nnoremap - ddgkP
nnoremap _ ddp
vnoremap - DgkP
vnoremap _ Dp

" Better uppercase stuff
inoremap <C-u> <esc>gUiwea

" Motions for inside brackets, parens, etc
onoremap ( i(
onoremap ) i(
onoremap [ i[
onoremap ] i[
onoremap { i{
onoremap } i{

" Surround in stuff
vnoremap <leader>s" <esc>`<i"<esc>`>la"<esc>
vnoremap <leader>s' <esc>`<i'<esc>`>la'<esc>
vnoremap <leader>s( <esc>`<i(<esc>`>la)<esc>
vnoremap <leader>s) <esc>`<i(<esc>`>la)<esc>
vnoremap <leader>s[ <esc>`<i[<esc>`>la]<esc>
vnoremap <leader>s) <esc>`<i[<esc>`>la]<esc>
vnoremap <leader>s{ <esc>`<i{<esc>`>la}<esc>
vnoremap <leader>s} <esc>`<i{<esc>`>la}<esc>

" ================================================================================================
" }}}
" ================================================================================================

" ================================================================================================
" Auto Commands {{{
" ================================================================================================

" I want to load indent and plugin settings for filetypes
filetype plugin on 

" manual folds for vim files
augroup vimrc
        autocmd!
        au BufAdd,BufRead .vimrc,init.vim 
                \ setlocal foldmethod=marker | 
                \ setlocal foldlevel=0
augroup end

" set tab width for assembly
augroup assembly
        autocmd!
        au Filetype nasm setlocal tabstop=4
        au Filetype nasm setlocal shiftwidth=4
        au Filetype asm  setlocal tabstop=4
        au Filetype asm  setlocal shiftwidth=4
        au BufNewFile,BufRead,BufAdd *.nasm set filetype=nasm " set .nasm files to nasm filetype
augroup end

" Rainbow brackets stuff
augroup rainbow_parentheses
        autocmd!
augroup end

if s:has_plugin('rainbow_parentheses.vim')
        autocmd rainbow_parentheses VimEnter * RainbowParenthesesActivate
        autocmd rainbow_parentheses Syntax   *   RainbowParenthesesLoadRound
        autocmd rainbow_parentheses Syntax   *   RainbowParenthesesLoadSquare
        autocmd rainbow_parentheses Syntax   *   RainbowParenthesesLoadBraces
endif

augroup frontend
        autocmd!
        au Filetype json,jsonc,css,scss,html,javascript,typescript setlocal tabstop=2
        au Filetype json,jsonc,css,scss,html,javascript,typescript setlocal shiftwidth=2
        au Filetype json,jsonc,css,scss,html,javascript,typescript setlocal tabstop=2
        au Filetype json,jsonc,css,scss,html,javascript,typescript setlocal shiftwidth=2
        au Filetype json,jsonc,css,scss,html                       setlocal colorcolumn=
        au Filetype json,jsonc,css,scss,html,javascript,typescript setlocal expandtab
augroup end

augroup rust
        autocmd!
        autocmd FileType *.rs setlocal filetype=rust
augroup end

augroup markdown
        autocmd!
        set colorcolumn=80
augroup end

augroup dirvish
        autocmd!
        au Filetype dirvish nmap <buffer> gu <Plug>(dirvish_up)
augroup end

" ================================================================================================
" }}}
" ================================================================================================

" ================================================================================================
" Commands {{{
" ================================================================================================

command! -nargs=0 Format call CocAction('format')

" Use Next and Prev to navigate problems
command! -nargs=0 DNext :call CocAction('diagnosticNext')<CR>
command! -nargs=0 DPrev :call CocAction('diagnosticPrevious')<CR>


" ================================================================================================
" }}}
" ================================================================================================
