" ----- Leader -----

let mapleader = "\<Space>"

set nocompatible              " be iMproved, required
filetype off                  " required

" ----- Plugins -----
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')

Plugin 'chriskempson/base16-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'godlygeek/tabular'
Plugin 'bling/vim-airline'
Bundle 'christoomey/vim-titlecase'
Bundle 'christoomey/vim-tmux-navigator'

" SnipMate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ----- Text formatting -----

set autoindent          " automatic indent new lines.
set smartindent         " make it smart.
set copyindent          " copy structure of existing lines.
set cindent             " enable automatic C program indenting.
set nowrap              " do not wrap lines.
set shiftwidth=2        " use two characters for tabs.
set softtabstop=2       " mindblowing.
set tabstop=2           " skullcracking.
set expandtab           " expand tabs to spaces.

" ----- UI settings -----

set ruler               " always show cursor position.
set showmode            " show the mode we're currently in.
set showcmd             " always display commands.
set showmatch           " highlight matching brackets/showbraces.
set list                " enable listcharacters.
set laststatus=2        " show status line.
set cursorline          " visualize current line.
set noerrorbells        " disable error bells.
set visualbell          " disable error bells.
set t_vb=               " disable error bells.
set number              " show current number instead of relative one.
set relativenumber      " show the relative line number
set splitright          " Opens vertical split right of current window
set splitbelow          " Opens horizontal split below current window
set hidden              " Buffers can exist in the background
set ttyfast             " Send more characters for redraws
set mouse=a             " Enable mouse mode use in all modes

" ----- File navigation -----

set wildmenu            " display all possibilities on autocomplete.
set wildmode=longest,list,full

" Saving a file
nnoremap <Leader>w :w<CR>
command! W  write
"
" ----- Movement -----

" leave your visual world behind.
nnoremap <up> :echoe "Use k"<CR>
nnoremap <down> :echoe "Use j"<CR>
nnoremap <left> :echoe "Use h"<CR>
nnoremap <right> :echoe "Use l"<CR>

" force myself to leave insert mode for movement.
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" no more arrows my dear.
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Less finger wrecking window navigation.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" When pasting, go to the end of the pasted content
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" ----- Searching -----

set ignorecase          " no case sensitivity please.
set smartcase           " search case sensitive if i'm willing to.
set incsearch           " do incremental search.
set hlsearch            " search highlighting

" ----- Syntax and such -----

syntax on               " enable syntax highlighting.
syntax enable           " enable syntax highlighting.
"set t_Co=256            " set to use 256 colors
let base16colorspace=256 " Access colors present in 256 colorspace
set background=dark     " set dark background
colorscheme base16-tomorrow

" ----- Formatting -----

set fileformat=unix     " always use unix fileformat.
set encoding=utf-8      " force UTF-8 encoding.

" ----- Custom mapping -----

" Faster buffer switching
map <C-m> :bnext<CR>
map <C-n> :bprev<CR>

" Faster tab switching
nmap <Leader>' :tabn<CR>
nmap <Leader>; :tabp<CR>

" F7 toggles highlighted search.
map <F7> :set hlsearch!<CR>

" make Y act like D, C, ... (i.e., yank up to the end of the line).
map Y y$

" faster buffer switching
nnoremap <Leader>b :CtrlPBuffer<CR>

" NERDTree Toggling
nnoremap <Leader>n :NERDTreeToggle<CR>

" ----- Remapping -----

inoremap jj <ESC>       " leave insert mode with 'jj'

" ----- Chromed out, pimped out -----

" visualize stuff.
set listchars=tab:→\ ,extends:»,precedes:«,trail:▒,nbsp:·

" on editing, jump to last known cursor position.
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" on save, remove trailing spaces.
autocmd BufWritePre * :%s/\s\+$//e

" Do not pollute the working directory with swap and other files.
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" custom statusline
set statusline=%<%f\ %m%r\ %=line\ %l\ of\ %L\ %15.15(col\ %c%V%)\ %25.25(%{&ff},%{strlen(&fenc)?&fenc:'none'}\ %y%)\ "

" .tpl files are mainly (x)html files, xhtml gives better omni completion.
autocmd BufNewFile,BufRead *.tpl set filetype=xhtml

" Setting the syntax for markdown files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" ----- Plugins -----

" Emmet
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<F5>'
autocmd FileType html,css,scss,sass EmmetInstall

" Tell snipmate where to get our snippets.
let g:snippets_dir = "~/.vim/snippets"

" CtrlP ignores.
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.git|node_modules|bower_components|vendor)$',
    \ 'file': '\v\.(swp)$',
    \ }
let g:ctrlp_working_path_mode = 0

" Airline Plugin
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1

" Commentary - Motion aware commenting
nmap cm  <Plug>Commentary

" ----- Fixes -----

" Allow backspace for everything.
set backspace=indent,eol,start
