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

set expandtab
set tabstop=4
set shiftwidth=4

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
Plug 'SirVer/ultisnips'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdcommenter'

Plug 'neomake/neomake'
autocmd! BufWritePost * Neomake
:highlight NeomakeErrorMsg ctermfg=227 ctermbg=237
let g:neomake_warning_sign={'text': '⚠', 'texthl': 'NeomakeErrorMsg'}
let g:neomake_javascript_enabled_makers = ['standard']

" Javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'],  'do': 'npm install' }
Plug 'jelera/vim-javascript-syntax', {'for': 'javascript' }
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'helino/vim-json'
autocmd FileType javascript set tabstop=2
autocmd FileType javascript set shiftwidth=2
autocmd FileType javascript retab
autocmd FileType json set tabstop=2
autocmd FileType json set shiftwidth=2
autocmd FileType json retab

" HTML
Plug 'othree/html5-syntax.vim', { 'for': 'html' }
Plug 'othree/html5.vim', { 'for': 'html' }

" Clojure
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

Plug 'Valloric/YouCompleteMe', { 'do': 'PATH=/usr/bin:$PATH ./install.py --all' }
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_autoclose_preview_window_after_insertion = 1

" Color
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'

" Tmux integration
Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

" Tagbar
Plug 'majutsushi/tagbar'
nmap <Leader>tl :TagbarToggle<CR>

call plug#end()
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme materialtheme
