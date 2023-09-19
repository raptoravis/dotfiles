" Options
set encoding=utf8
set clipboard=unnamedplus " Enables the clipboard between Vim/Neovim and other applications.
set completeopt=noinsert,menuone,noselect " Modifies the auto-complete menu to behave more like an IDE.
set cursorline " Highlights the current line in the editor
set hidden " Hide unused buffers
set autoindent " Indent a new line
set mouse=a " Allow to use the mouse in the editor
set number " Shows the line numbers
set splitbelow splitright " Change the split screen behavior
set title " Show file title
set wildmenu " Show a more advance menu
set guifont=hack_nerd_font:h11
"set cc=100 " Show at 80 column a border for good code style                      
filetype plugin indent on   " Allow auto-indenting depending on file type
syntax on
set spell " enable spell check (may need to download language package)
set ttyfast " Speed up scrolling in Vim`:wq

let g:kite_supported_languages = ['python', 'javascript']

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'davidhalter/jedi-vim'
Plug 'vim-scripts/indentpython.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-visual-selection'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

"colorscheme gruvbox
let g:bargreybars_auto=0
let g:airline_solorized_bg='dark'
let g:airline_powerline_fonts=1
let g:airline#extension#tabline#enable=1
let g:airline#extension#tabline#left_sep=' '
let g:airline#extension#tabline#left_alt_sep='|'
let g:airline#extension#tabline#formatter='unique_tail'
let NERDTreeQuitOnOpen=1

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFolderNodeDefaultSymbol = '#'
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['nerdtree'] = '#'

" PYTHON PROVIDERS {{{
if has('macunix')

" OSX
let g:python3_host_prog = '/usr/local/bin/python3' " -- Set python 3 provider
let g:python_host_prog = '/usr/local/bin/python2' " --- Set python 2 provider

elseif has('unix')

" Ubuntu
let g:python3_host_prog = '/usr/bin/python3' " -------- Set python 3 provider
let g:python_host_prog = '/usr/bin/python' " ---------- Set python 2 provider

elseif has('win32') || has('win64')

" Window
let g:python3_host_prog = 'C:/Anaconda3/python.ex3' " -------- Set python 3 provider

endif
" }}}


" Open nerdtree by default
" autocmd vimenter * NERDTree

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

map <C-n> :NERDTreeToggle<CR>

nnoremap <C-p> :Files<Cr>
nnoremap <C-l> :Buffers<Cr>

nnoremap ,c :call NERDComment(0,"toggle")<CR>
nnoremap <C-_> :call NERDComment(0,"toggle")<CR>

let g:fzf_layout = { 'down': '40%' }

" https://codevion.github.io/#!index.md

"https://casas-alejandro.medium.com/your-ultimate-vim-setup-for-python-b43a522b1152
":, then, PlugInstall
