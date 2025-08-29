" Run :PlugInstall to install all plugins

call plug#begin()

Plug 'preservim/nerdcommenter'
    " \c<Space> Toggle comments on the selected lines
    " \cc Comment
    " \cu Uncomment
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'cocopon/iceberg.vim'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'github/copilot.vim', {'branch': 'main'} ":Copilot setup

call plug#end()

" NERDTree settings
map <C-n> :NERDTreeToggle<CR>
:let g:NERDTreeWinSize=22

" Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" FZF settings
set rtp+=~/.fzf
nnoremap <leader>f :Files<CR>
" <leader> is usually mapped to \
"nnoremap <C-f> :Files<CR>
"
nnoremap <leader>g :TagbarToggle<CR>

" Set encoding and file formats
set encoding=utf-8
set fileencoding=utf-8
set fileformats=unix,dos,mac

" Line numbers and relative numbers
set number

" Syntax highlighting and ColorScheme
silent! colorscheme iceberg
set background=dark
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight NonText ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight Folded ctermbg=NONE guibg=NONE
autocmd ColorScheme * highlight EndOfBuffer ctermbg=NONE guibg=NONE
syntax on

" Indentation settings
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

" Set tab width for HTML, CSS, JavaScript, and Vue files
autocmd FileType html,css,scss,javascript,vue setlocal shiftwidth=2 tabstop=2 expandtab


" Enables automatic indentation based on the file type
filetype indent on

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Display settings
set wrap
set cursorline

" Disable compatibility mode
set nocompatible

" Disable mouse interaction in normal mode
set mouse=""

" Show the command being executed at the bottom
set showcmd

" Improve formatting options for comments
set formatoptions=croq

" Don't automatically wrap lines
set textwidth=0

" Shows a vertical ruler at the configured column (default at 80)
set ruler

" Move the cursor to the last position when reopening a file
if has("autocmd")
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif
 
inoremap jk <Esc>:w<CR>
nnoremap zz :wa<CR>:qa<CR>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

noremap YY "+y<CR>
