" ----- Defaults -----

set nocompatible        " use Vim defaults.

" ----- Leader -----

let mapleader = " "

" ----- Pathogen -----

call pathogen#infect()  " Pathogen must be called before filetype detection.
filetype plugin indent on

" ----- Text formatting -----

set autoindent          " automatic indent new lines.
set smartindent         " make it smart.
set copyindent          " copy structure of existing lines.
set cindent             " enable automatic C program indenting.
set nowrap              " do not wrap lines.
set shiftwidth=4        " use four characters for tabs.
set softtabstop=4       " mindblowing.
set tabstop=4           " skullcracking.
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
set splitright          " Opens vertical split right of current window
set splitbelow          " Opens horizontal split below current window
set hidden              " Buffers can exist in the background
set ttyfast             " Send more characters for redraws
set mouse=a             " Enable mouse mode use in all modes

" ----- File navigation -----

set wildmenu            " display all possibilities on autocomplete.
set wildmode=longest,list,full

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

" Less finger wrecking window navigation.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ----- Searching -----

set ignorecase          " no case sensitivity please.
set smartcase           " search case sensitive if i'm willing to.
set incsearch           " do incremental search.

" ----- Syntax and such -----

syntax on               " enable syntax highlighting.
syntax enable           " enable syntax highlighting.
set t_Co=256            " set to use 256 colors
set background=dark     " set dark background
colorscheme solarized   " use the solarized color scheme

" ----- Formatting -----

set fileformat=unix     " always use unix fileformat.
set encoding=utf-8      " force UTF-8 encoding.

" ----- Custom mapping -----

" F7 toggles highlighted search.
map <F7> :set hlsearch!<CR>

" make Y act like D, C, ... (i.e., yank up to the end of the line).
map Y y$

" ----- Remapping -----

inoremap jj <ESC>       " leave insert mode with 'jj'

" ----- Chromed out, pimped out -----

" visualize stuff.
set listchars=tab:→\ ,extends:»,precedes:«,trail:▒,nbsp:·

" on editing, jump to last known cursor position.
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" on save, remove trailing spaces.
autocmd BufWritePre * :%s/\s\+$//e

" Do not pollute the working directory with swap and other files.
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" custom statusline
set statusline=%<%f\ %m%r\ %=line\ %l\ of\ %L\ %15.15(col\ %c%V%)\ %25.25(%{&ff},%{strlen(&fenc)?&fenc:'none'}\ %y%)\ "

" .tpl files are mainly (x)html files, xhtml gives better omni completion.
autocmd BufNewFile,BufRead *.tpl set filetype=xhtml

" ----- Plugins -----

" Tell snipmate where to get our snippets.
let g:snippets_dir = "~/.vim/snippets"

" CtrlP ignores.
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.git|vendor)$',
    \ 'file': '\v\.(swp)$',
    \ }

" Airline Plugin
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_detect_whitespace=0

" ----- Fixes -----

" Allow backspace for everything.
set backspace=indent,eol,start