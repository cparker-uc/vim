set nocompatible
filetype off
" vundle setup, plugin management

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('~/.vim/bundle')

Plugin 'sheerun/vim-polyglot'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'vim-latex/vim-latex'
Plugin 'bchretien/vim-latex'
Plugin 'LucHermitte/lh-vim-lib'
Plugin 'LucHermitte/vim-build-tools-wrapper'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'


call vundle#end()
filetype plugin indent on

Bundle 'nerdtree'
"Bundle 'ajh17/VimCompletesMe'
Bundle 'project'
Bundle 'taglist_46'
Bundle 'undotree-rel_4.3'
Bundle 'surround'

"let g:ycm_autoclose_preview_window_after_completion=1

" ignore .pyc files in NERDTree
let NERDTreeIgnore=['\.pyc$', '\~$']

" vim-latex settings
"filetype plugin on
"set grepprg=grep\ -nH\ $*
"filetype indent on
"let g:tex_flavor='latex'
"let g:latex_toc_enabled=1

" Custom Headers
source ~/.vim/headers/headers.vim

" Basic Settings

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
if has('filetype')
  filetype indent plugin on
endif

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

" Use the standard clipboard buffer
set clipboard=unnamed

" Allow folding based on indentation (so I can fold Python functions, classes,
" etc...)
set foldmethod=indent
set foldlevel=99
set guifont=Menlo:h14

" Don't allow modelines (lines at beginning or end of file to set
" file-specific options, such as tab width). This is because they have
" historically been viewed as a security risk
set nomodeline

" Use UTF-8 file encoding
set encoding=utf-8

" Change behavior related to size of tabs and indentation
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set scrolloff=10
set autoindent

" Show indications of current editing mode and command being used
set showmode
set showcmd

" Allow current file to stay open in buffer when opening another file in same
" window
set hidden

" Use tab completion in command line interface
set wildmenu
set wildmode=list:longest

" Ask to save when quitting without save
set confirm

" Stop beep on failed command
set visualbell
" Stop screen from flashing on failed command
set t_vb=

" Enable use of the mouse for all modes
if has('mouse')
  set mouse=a
endif

set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
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

" Aesthetics

set background=dark

" Python settings

let python_highlight_all=1

au FileType python nnoremap <buffer> <localleader>c I#<esc>
au FileType python nnoremap <buffer> <localleader>d I<esc>lx
au FileType python vnoremap <buffer> <localleader>c I#<esc>
au FileType python vnoremap <buffer> <localleader>d I<esc>lx
au FileType vim nnoremap <buffer> <localleader>c I"<esc>
au FileType vim vnoremap <buffer> <localleader>c I"<esc>
au FileType vim nnoremap <buffer> <localleader>d I<esc>lx

au FileType python noremap <buffer> <F7> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
au FileType python inoremap <buffer> <F7> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" au BufNewFile,BufRead *.py
" \ set tabstop=4
" \ set softtabstop=4
" \ set shiftwidth=4
" \ set textwidth=79
" \ set expandtab
" \ set autoindent
" \ set fileformat=unix

" All languages settings

" should match bad whitespace in python and c, currently not working
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Mappings and shortcuts
" vim-latex mappings
nnoremap <leader>lt :call latex#toc#toggle()<CR>

" Basics

inoremap tw <ESC>
let maplocalleader = ";"
let mapleader = ","

let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
colorscheme distinguished

" Miscellaneous

nnoremap <F2> :set filetype<CR>
au FocusLost * :wa
vnoremap . :norm.<CR>

" Not sure why these were defined
"inoremap <F1> <ESC>
"nnoremap <F1> <ESC>
"vnoremap <F1> <ESC>

" Leader shortcuts

nnoremap <leader><Up> ]s
nnoremap <leader><Down> [s
nnoremap <leader>W :%s/\S\zs\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>cl :let @/=''<cr>
nnoremap <leader>ft Vatzf
nnoremap <leader>S jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>
nnoremap <leader>q gqip
nnoremap <leader>v V`]
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>j VipJ
nnoremap <leader>q gqip
nnoremap <leader>f 1z=
nnoremap <leader>p :!git commit -am 'Quick  VIM commit.' && git push origin master<CR><CR>
nnoremap <leader>pb :!git symbolic-ref --short HEAD \| pbcopy && git commit -am 'Standard commit to current branch.' && git push origin $(pbpaste)<CR><CR>
nnoremap <leader>d :read !date<CR>
nnoremap <leader>r :!!<CR>
nnoremap <leader>a :norm @a<CR>
nnoremap <leader>b :norm @b<CR>
nnoremap <leader>1 :norm @1<CR>
nnoremap <leader>2 :norm @2<CR>
nnoremap <leader>3 :norm @3<CR>
nnoremap <leader>4 :norm @4<CR>
nnoremap <leader>5 :norm @5<CR>
nnoremap <leader>l :CtrlP<CR>
nnoremap <leader>nt :NERDTree<CR>
nnoremap <leader>s :set spell!<CR>
nnoremap <leader>n :set nonumber!<CR>
nnoremap <leader>rn :set norelativenumber!<CR>
nnoremap <leader>ch :nohl<CR>
nnoremap <leader><Left> :tabprevious<CR>
nnoremap <leader><Right> :tabnext<CR>
nnoremap <leader>i gt
nnoremap <leader>y <C-W>T
nnoremap <leader><tab> :><CR>
vnoremap <leader><tab> :><CR>
nnoremap <leader><S-tab> :<<CR>
vnoremap <leader><S-tab> :<<CR>

" Taglist shortcuts
nnoremap <F6> :TlistToggle<CR>
nnoremap <C-F6> :TlistUpdate<CR>

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

" Operator-pending Mappings
onoremap p i(
