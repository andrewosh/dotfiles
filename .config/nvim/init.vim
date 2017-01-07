call plug#begin('~/.vim/plugged')

""""" Top-level settings

nnoremap <tab> %
vnoremap <tab> %
let mapleader = ","

set ignorecase
set smartcase
set gdefault

set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

" Better window management
function! WinMove(key) 
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr()) "we havent moved
    if (match(a:key,'[jk]')) "were we going up/down
      wincmd v
    else 
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

map <tab>h              :call WinMove('h')<cr>
map <tab>k              :call WinMove('k')<cr>
map <tab>l              :call WinMove('l')<cr>
map <tab>j              :call WinMove('j')<cr>

nmap <left>  :3wincmd <<cr>
nmap <right> :3wincmd ><cr>
nmap <up>    :3wincmd +<cr>
nmap <down>  :3wincmd -<cr>


""""" Plugin-specific settings

Plug 'scrooloose/nerdtree'
" NerdTREE additions
map <leader>n :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

Plug 'kien/rainbow_parentheses.vim'
Plug 'mileszs/ack.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'tpope/vim-sensible'
Plug 'SirVer/ultisnips'

Plug 'vim-syntastic/syntastic'
" Syntastic additions
let g:syntastic_javascript_checkers = ['standard']

" Javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'moll/vim-node', {'for': 'javascript' }

" HTML
Plug 'othree/html5-syntax.vim', { 'for': 'html' }
Plug 'othree/html5.vim', { 'for': 'html' }

" Clojure
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

Plug 'Valloric/YouCompleteMe', { 'do': 'PATH=/usr/bin:$PATH ./install.py' }
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

" Tmux integration
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

call plug#end()
