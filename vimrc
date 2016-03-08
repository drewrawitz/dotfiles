set nocompatible                    " get the latest Vim settings / options

so ~/.vim/plugins.vim
syntax enable

set backspace=indent,eol,start
let mapleader = "\<Space>"

"--------------- UI Settings --------------"
set showmode                        " show the mode we're currently in.
set showcmd                         " always display commands.
set showmatch                       " highlight matching brackets/showbraces.
set laststatus=2                    " show status line.
set noerrorbells visualbell t_vb=   " disable error bells.
set mouse=a                         " enable mouse mode use in all modes
set hidden                          " buffers can exist in the background
set ttyfast                         " send more characters for redraws

"--------------- File Navigation --------------"
set wildmenu            " display all possibilities on autocomplete.
set wildmode=longest,list,full

"--------------- Visuals --------------"
colorscheme atom-dark-256
set t_CO=256

" Faking a custom left padding for each window
hi LineNr ctermbg=bg
set foldcolumn=2
hi foldcolumn ctermbg=bg

" Get rid of ugly split borders.
hi vertsplit ctermbg=bg ctermfg=bg

" Do not pollute the working directory with swap and other files.
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" ----- Text formatting -----
set nowrap              " do not wrap lines.
set shiftwidth=2        " use two characters for tabs.
set softtabstop=2       " mindblowing.
set tabstop=2           " skullcracking.
set expandtab           " expand tabs to spaces.

"--------------- Search --------------"
set ignorecase          " no case sensitivity please.
set smartcase           " search case sensitive if i'm willing to.
set incsearch           " do incremental searches

"--------------- Split Management --------------"
set splitbelow          " when opening a vertical split, open it below
set splitright          " when opening a horizontal split, open it to the right

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>

nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

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

" no more arrows
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

"--------------- Mappings --------------"
" Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>

" Make it easy to edit the Vimrc plugins
nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr>

" Make it easy to edit snippets
nmap <Leader>es :tabedit ~/.vim/snippets<cr>

" Add simple highlight removal
nmap <F7> :set hlsearch!<CR>

" Leave insert mode with 'jj'
inoremap jj <ESC>

" Saving a file
nnoremap <Leader>w :w<CR>
command! W  write

" When pasting, go to the end of the pasted content
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" NERDTree Toggling
nnoremap <Leader>n :NERDTreeToggle<CR>

"--------------- Auto Commands --------------"
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

" on save, remove trailing spaces.
autocmd BufWritePre * :%s/\s\+$//e

" enable autocompletion
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd BufNewFile,BufRead *.scss             set ft=scss.css

"--------------- Plugins --------------"

" CtrlP
nmap <C-e> :CtrlPMRUFiles<cr>

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/](\.git|node_modules|bower_components|vendor)$',
    \ 'file': '\v\.(swp)$',
    \ }
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window = 'min:1,max:10,results:10'

" Faster buffer switching
nnoremap <Leader>b :CtrlPBuffer<CR>
map <C-m> :bnext<CR>
map <C-n> :bprev<CR>

" GReplace.vim
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'
