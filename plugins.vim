call plug#begin('~/.vim/plugged')

" CtrlP
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
nmap <leader>s :split<CR><c-w>j<c-p>
nmap <leader>v :vsplit<CR><c-w>l<c-p>
nmap <leader>b :CtrlPBuffer<cr>
nmap <leader>o :CtrlP<cr>
nmap <leader>t :call OpenExploreTab()<cr><c-p>

let g:ctrlp_working_path_mode = 'w'

function CtrlP()
  :CtrlP
endfunction
autocmd VimEnter * if !argc() | :call CtrlP() | endif

" Tagbar
Plug 'majutsushi/tagbar'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

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

" Dart
Plug 'dart-lang/dart-vim-plugin'

" Ack
Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'
nnoremap <Leader>a :Ack!<Space>

" YouCompleteMe
nnoremap <leader>gd :YcmCompleter GoToDeclaration<cr>
nnoremap <leader>gg :YcmCompleter GoToDefinition<cr>
nnoremap <leader>gi :YcmCompleter GoToInclude<cr>
nnoremap <leader>gp :YcmCompleter GoToParent<cr>

" Syntastic
Plug 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
set t_Co=256
let g:airline_theme='bubblegum'

" [buffer number] followed by filename:
"set statusline=[%F]\ %t
" for Syntastic messages:
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
" show line#:column# on the right hand side
"set statusline+=%=%l:%c


call plug#end()
" let base16colorspace=256  " Access colors present in 256 colorspace
" colorscheme materialtheme
