let mapleader = ","

set number
set relativenumber

set ignorecase
set smartcase
set gdefault

set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

set expandtab
set tabstop=2
set shiftwidth=2

set wildmode=longest,list,full
set wildmenu

set backspace=indent,eol,start

set guicursor=

set autoread

" Get rid of the swap file garbage
set shortmess+=A

nnoremap <silent> <leader>rc :e ~/.vimrc<CR>

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

function OpenExploreTab()
  :tabedit
  :Explore
endfunction
nmap <leader>t :call OpenExploreTab()<cr>
