" ==========================================================
" Cross-platform Vim config (Windows + Linux)
" Inspired by Neovim-style UX: plugin manager, sensible defaults,
" fuzzy finding, tree explorer, statusline, git signs, autopairs, etc.
" ==========================================================

if &compatible
  set nocompatible
endif

" ------------------------------
" OS detection
" ------------------------------
let g:is_windows = has('win32') || has('win64')
let g:is_linux = has('unix') && !g:is_windows

" ------------------------------
" Basic encoding / UI / behavior
" ------------------------------
set encoding=utf-8
set fileencodings=utf-8,gbk,latin1
scriptencoding utf-8

set number
set relativenumber
set cursorline
set hidden
set wildmenu
set wildmode=longest:full,full
set showmode
set showcmd
set cmdheight=1
set updatetime=300
set signcolumn=yes
set termguicolors

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smartindent
set autoindent
set backspace=indent,eol,start

set ignorecase
set smartcase
set incsearch
set hlsearch

set splitright
set splitbelow
set mouse=a
set clipboard=unnamed,unnamedplus

" Better completion menu behavior
set completeopt=menuone,noinsert,noselect

" ------------------------------
" Cross-platform persistent dirs
" ------------------------------
if g:is_windows
  let s:data_home = expand('$LOCALAPPDATA') . '\\vim-data'
else
  let s:data_home = expand('~/.local/share/vim')
endif

if !isdirectory(s:data_home)
  call mkdir(s:data_home, 'p')
endif

let &undodir = s:data_home . (g:is_windows ? '\\undo' : '/undo')
if !isdirectory(&undodir)
  call mkdir(&undodir, 'p')
endif
set undofile

let &backupdir = s:data_home . (g:is_windows ? '\\backup' : '/backup')
if !isdirectory(&backupdir)
  call mkdir(&backupdir, 'p')
endif
set backup

let &directory = s:data_home . (g:is_windows ? '\\swap' : '/swap')
if !isdirectory(&directory)
  call mkdir(&directory, 'p')
endif
set swapfile

" ------------------------------
" Plugin manager: vim-plug
" Auto install if missing
" ------------------------------
if g:is_windows
  let s:plug_vim = expand('~/vimfiles/autoload/plug.vim')
  let s:plug_home = expand('~/vimfiles/plugged')
else
  let s:plug_vim = expand('~/.vim/autoload/plug.vim')
  let s:plug_home = expand('~/.vim/plugged')
endif

if empty(glob(s:plug_vim))
  if executable('curl')
    silent execute '!curl -fLo ' . shellescape(s:plug_vim) . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * ++once PlugInstall --sync | source $MYVIMRC
  else
    echohl WarningMsg
    echom 'vim-plug not found and curl is unavailable. Please install plug.vim manually.'
    echohl None
  endif
endif

call plug#begin(s:plug_home)

" File explorer
Plug 'preservim/nerdtree'

" Fuzzy finder (requires ripgrep for :Rg)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git change signs
Plug 'airblade/vim-gitgutter'

" Auto pairs
Plug 'jiangmiao/auto-pairs'

" Better commenting
Plug 'tpope/vim-commentary'

" Surround text objects
Plug 'tpope/vim-surround'

" Syntax collection
Plug 'sheerun/vim-polyglot'

call plug#end()

" ------------------------------
" Plugin options
" ------------------------------
let g:airline_powerline_fonts = 1
let g:airline_theme='dark'
let g:gitgutter_map_keys = 0

" NERDTree
nnoremap <leader>e :NERDTreeToggle<CR>

" FZF helpers
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :Rg<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fh :Helptags<CR>

" ------------------------------
" Keymaps inspired by Neovim usage
" ------------------------------
let mapleader = ' '

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>h :nohlsearch<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ------------------------------
" Quality-of-life commands
" ------------------------------
command! PlugRefresh PlugUpgrade | PlugUpdate

augroup vimrc_auto_update_hint
  autocmd!
  autocmd VimEnter * if exists(':PlugUpdate') | echom 'Run :PlugRefresh to upgrade plugin manager + plugins.' | endif
augroup END
