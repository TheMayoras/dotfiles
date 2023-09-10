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
        Plug 'kana/vim-textobj-user'
        Plug 'kana/vim-textobj-entire'
        Plug 'tpope/vim-surround'
        Plug 'junegunn/vim-easy-align'
	" =======================================================================
	" }}}                              
	" =======================================================================

	" =======================================================================
	"                                Color Schemes {{{
	" =======================================================================
	Plug 'drewtempelmeyer/palenight.vim'
        Plug 'limadm/vim-blues'
        Plug 'tjammer/blayu.vim'
        Plug 'petelewis/vim-evolution'
        Plug 'reedes/vim-colors-pencil'
        Plug 'sainnhe/sonokai'
        Plug 'joshdick/onedark.vim'
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
        Plug 'mxw/vim-jsx'
        Plug 'peitalin/vim-jsx-typescript'
        Plug 'HerringtonDarkholme/yats.vim'
        Plug 'OmniSharp/omnisharp-vim'
        Plug 'hashivim/vim-terraform'
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

function! DelSwap()
  let l:swapfile = undofile(bufname('%'))
  let l:cmd = 'rm ' . shellescape(l:swapfile)
  echo 'Running "' . l:cmd . '"'
  return system(l:cmd)
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

" This enables native clipboard access for neovim from wsl
let g:clipboard = {
          \   'name': 'win32yank-wsl',
          \   'copy': {
          \      '+': 'win32yank.exe -i --crlf',
          \      '*': 'win32yank.exe -i --crlf',
          \    },
          \   'paste': {
          \      '+': 'win32yank.exe -o --lf',
          \      '*': 'win32yank.exe -o --lf',
          \   },
          \   'cache_enabled': 0,
          \ }

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
" ================================================================================================
" }}}
" ================================================================================================

" ================================================================================================
" Plugin Settings {{{
" ================================================================================================
" typescript-vim {{{
let g:typescript_indent_disable = 1
" }}}
" Rainbow Brackets {{{
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

" }}}
" Lightline {{{
let g:lightline = {
	\ 'component': {
	\   'lineinfo': ' %3l:%-2v',
	\ },
	\ 'component_function': {
	\   'readonly': 'LightlineReadonly',
	\   'filename': 'LightlineFilename',
	\   'fugitive': 'LightlineFugitive',
        \   'obsession': 'ObsessionStatus',
	\ },
	\ 'active': {
	\     'left': [ [ 'mode', 'paste' ],
	\             [ 'fugitive', 'git-status', 'filename', 'modified', 'readonly' ] ],
        \     'right': [ [ 'lineinfo' ],
        \             [ 'percent' ],
        \             [ 'obsession', 'fileformat', 'fileencoding', 'filetype' ] ] 
	\ },
	\ 'subseparator': { 'left': '', 'right': '' },
        \ 'separator': {'left': '', 'right': ''},
        \ 'colorscheme': 'onedark',
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

" }}}
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

" ================================================================================================
" }}}
" Coc & Completion {{{
" ================================================================================================

let g:coc_global_extensions = [ 
        \ 'coc-angular',
        \ 'coc-css',
        \ 'coc-eslint',
        \ 'coc-html',
        \ 'coc-json',
        \ 'coc-markdown-preview-enhanced',
        \ 'coc-omnisharp',
        \ 'coc-postfix',
        \ 'coc-prettier',
        \ 'coc-pyright',
        \ 'coc-rust-analyzer',
        \ 'coc-sql',
        \ 'coc-styled-components',
        \ 'coc-toml',
        \ 'coc-tsserver',
        \ 'coc-webview',
        \ 'coc-xml' 
\ ]

function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Insert <tab> when previous text is space, refresh completion if not.
inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1):
        \ <SID>check_back_space() ? "\<Tab>" :
        \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

if has('nvim')
        inoremap <silent><expr> <c-space> coc#refresh()
else
        inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

nmap <silent> <leader>a :CocAction<CR>
vmap <silent> ga <Plug>(coc-codeaction-selected)
nmap <silent> ga <Plug>(coc-codeaction-selected)W
nmap <silent> ge <Plug>(coc-diagnostic-prev)
nmap <silent> gw <Plug>(coc-diagnostic-next)
nmap <silent> gl <Plug>(coc-diagnostic-info)  
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gu <Plug>(coc-references)
nmap <silent> gr <Plug>(coc-rename)
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
" Dirvish {{{
let g:dirvish_mode = 2
let g:loaded_netrwPlugin = 1
command! -nargs=? -complete=dir Explore Dirvish <args> " Replace the netrw commands with dirvish
command! -nargs=? -complete=dir Sexplore belowright split | silent Dirvish <args> " Replace the netrw commands with dirvish
command! -nargs=? -complete=dir Vexplore leftabove vsplit | silent Dirvish <args> " Replace the netrw commands with dirvish
" }}}
" Javascript {{{
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow  = 1
" }}}
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

" ========================
" Scrolling
" ========================
nnoremap <M-h> zh
nnoremap <M-l> zl

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

" FZF hotkeys
nnoremap <leader>f :Files<CR>
nnoremap <leader>F :exe 'Files '.expand('%:h')<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>B :BLines!<CR>
nnoremap <leader>r :Rg!<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>c :History:<CR>

" Handy stuff
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>e :Dirvish<CR>
nnoremap <leader>d :Dirvish %<CR>

" Magic seraching by default
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v
cnoremap %s/ %s/\v

" Better uppercase stuff
inoremap <C-u> <esc>gUiwea

nnoremap <leader>l :set listchars=tab:<->,trail:~,space:·,eol:$,conceal:ᴴ,nbsp:¯ list!<CR>

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
        autocmd rainbow_parentheses VimEnter *   RainbowParenthesesActivate
        autocmd rainbow_parentheses Syntax   *   RainbowParenthesesLoadRound
        autocmd rainbow_parentheses Syntax   *   RainbowParenthesesLoadSquare
        autocmd rainbow_parentheses Syntax   *   RainbowParenthesesLoadBraces
endif

augroup frontend
        autocmd!
        au Filetype json,jsonc,css,scss,html,javascript,typescript,typescriptreact setlocal tabstop=2
        au Filetype json,jsonc,css,scss,html,javascript,typescript,typescriptreact setlocal shiftwidth=2
        au Filetype json,jsonc,css,scss,html                                       setlocal colorcolumn=
        au Filetype json,jsonc,css,scss,html,javascript,typescript,typescriptreact setlocal expandtab
augroup end

augroup rust
        autocmd!
        autocmd FileType *.rs setlocal filetype=rust
augroup end

augroup markdown
        autocmd!
        autocmd Filetype markdown setlocal colorcolumn=80
        autocmd Filetype markdown setlocal tabstop=2 shiftwidth=2 expandtab
        autocmd Filetype markdown setlocal spell
augroup end

augroup dirvish
        autocmd!
        au Filetype dirvish nmap <buffer> gu <Plug>(dirvish_up)
augroup end

augroup csharp
        autocmd!
        au Filetype cs set colorcolumn=60
        au Filetype cs setlocal tabstop=4
        au Filetype cs setlocal shiftwidth=4
        au Filetype cs setlocal colorcolumn=
        au Filetype cs setlocal expandtab
augroup end

augroup difftool
        autocmd!
        au FileWritePre * |
                if &diff |
                        nnoremap <silent> <leader>q :qall<CR> |
                endif
augroup end

augroup fish_config
        autocmd!
        au BufRead config.fish set foldmethod=marker 
        au BufRead config.fish set foldmarker={{{,}}}
augroup end

function g:OnMarkdownBufEnter() 
        if &ft ==# "markdown"
                CocCommand markdown-preview-enhanced.openPreview
        endif
endfun
augroup markdown
        autocmd!
        au FileType markdown set spell
        au FileType markdown CocCommand markdown-preview-enhanced.openPreview
        au BufEnter * call g:OnMarkdownBufEnter()
augroup end

" augroup wsl_yank
"         autocmd!
" augroup end
" 
" let s:clip = system(['which', 'clip.exe'])
" if executable(s:clip)
"         fun s:copy_to_clip()
" 
"         endfun
"         autocmd wsl_yank TextYankPost * call <SID>copy_to_clip(v:event)
" endif

" ================================================================================================
" }}}
" ================================================================================================

" ================================================================================================
" Commands {{{
" ================================================================================================

command! -nargs=0 Format call CocAction('format')

" Use Next and Prev to navigate problems
command! -nargs=0 DNext :call CocAction('diagnosticNext')
command! -nargs=0 DPrev :call CocAction('diagnosticPrevious')

" Delete swap file (good if corrupted)
command! -nargs=0 DelSwap :call DelSwap()

" ================================================================================================
" }}}
" ================================================================================================
