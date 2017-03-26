" vundle setup, plugin management

set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin('~/.vim/bundle')


Plugin 'marik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline' , {'rtp': 'powerline/bindings/vim/'}
Bundle 'LucHermitte/lh-vim-lib'
Bundle 'LucHermitte/vim-build-tools-wrapper'
Bundle 'Valloric/YouCompleteMe'
Bundle 'nerdtree'
Bundle 'project'
Bundle 'taglist_46'
Bundle 'undotree-rel_4.3'
Bundle 'surround'


call vundle#end()

let g:ycm_autoclose_preview_window_after_completion=1

" ignore .pyc files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']


" Basic Settings

filetype plugin indent on
filetype off
syntax on

set clipboard=unnamed
set foldmethod=indent
set foldlevel=99
set shell=/bin/zsh
set guifont=Menlo:h14
set nocompatible
set modelines=0
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set relativenumber
set noundofile
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <tab> %
vnoremap <tab> %
set wrap
set linebreak
set nolist
set formatoptions=qrn1
set spell spelllang=en_us
set colorcolumn=80
nnoremap <space> za
nnoremap <F5> :UndotreeToggle<CR>
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Aesthetics

set background=dark

" Python settings

let python_highlight_all=1

au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_bas_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" All languages settings

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Mappings and shortcuts

" Basics

inoremap jk <ESC>
let mapleader = ","

" Miscellaneous

nnoremap <F2> :set filetype<CR>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
au FocusLost * :wa
vnoremap . :norm.<CR>

" Leader shortcuts

nnoremap <leader><Up> ]s
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>a :Ack
nnoremap <leader>ft Vatzf
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
nnoremap <leader>q gqip
nnoremap <leader>v V`]
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>j VipJ
nnoremap <leader>q gqip
nnoremap <leader>f 1z=
nnoremap <leader>u :!git pull website master && git commit -am 'Standard commit.' && git push website master<CR><CR>
nnoremap <leader>p :!git commit -am 'Standard commit.' && git push origin master<CR><CR>
nnoremap <leader>d :read !date<CR>
nnoremap <leader>r :!!<CR>
nnoremap <leader>m :norm @a<CR>
nnoremap <leader>l :CtrlP<CR>
nnoremap <leader>nt :NERDTree<CR>
nnoremap <leader>s :set spell!<CR>
nnoremap <leader>n :set nonumber!<CR>
nnoremap <leader>rn :set norelativenumber!<CR>
nnoremap <leader>c :nohl<CR>
nnoremap <leader>pa :set nopaste!<CR>
nnoremap <leader>h :set ft=HTML<CR><CR>
nnoremap <leader><Left> :tabprevious<CR>
nnoremap <leader><Right> :tabnext<CR>
nnoremap <leader>i gt
nnoremap <leader>y <C-W>T
" Control shortcuts

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-g> <C-W>gf
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

