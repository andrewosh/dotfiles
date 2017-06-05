call plug#begin('~/.vim/plugged')

""""" Top-level settings

nnoremap <tab> %
vnoremap <tab> %
let mapleader = ","

set number
set relativenumber

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

:set colorcolumn=80

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


""""" Plugin-specific settings

" netrw settings
map <leader>n :Explore<cr>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
function StartExplorer()
    :Explore
endfunction
autocmd VimEnter * if !argc() | :call StartExplorer() | endif

" Text linking
Plug 'vim-scripts/utl.vim'

" Org-Mode
Plug 'jceb/vim-orgmode'

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'

" Use deoplete with assorted autocompletion features + SuperTab
let g:deoplete#enable_at_startup = 1
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete'
\]
set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']

autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:UltiSnipsExpandTrigger="<C-a>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" General goodness
Plug 'tpope/vim-obsession'
Plug 'kien/rainbow_parentheses.vim'
Plug 'mileszs/ack.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'SirVer/ultisnips'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/L9'

Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
nmap <leader>s :split<CR><c-w>j<c-p>
nmap <leader>v :vsplit<CR><c-w>l<c-p>
nmap <leader>b :CtrlPBuffer<cr>
nmap <leader>o :CtrlP<cr>
let g:ctrlp_working_path_mode = 'w'

Plug 'w0rp/ale'

" Javascript
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'],  'do': 'npm install' }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'jelera/vim-javascript-syntax', {'for': ['javascript', 'javascript.jsx']  }
Plug 'moll/vim-node', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'isRuslan/vim-es6'
Plug 'andrewosh/vim-react-snippets'
autocmd FileType javascript set tabstop=2
autocmd FileType javascript set shiftwidth=2
autocmd FileType javascript retab
autocmd FileType json set tabstop=2
autocmd FileType json set shiftwidth=2
autocmd FileType json retab
let g:javascript_plugin_flow = 1
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" Typescript
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }

" JSX
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
let g:jsx_ext_required = 0

" Flow
Plug 'flowtype/vim-flow'
let g:flow#enable=1
let g:flow#autoclose=1

" Protobuf
Plug 'uarun/vim-protobuf'

" HTML
Plug 'othree/html5-syntax.vim', { 'for': 'html' }
Plug 'othree/html5.vim', { 'for': 'html' }

" YAML
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

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
