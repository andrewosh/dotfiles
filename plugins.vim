call plug#begin('~/.vim/plugged')

" CtrlP
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
nmap <leader>s :split<CR><c-w>j<c-p>
nmap <leader>v :vsplit<CR><c-w>l<c-p>
nmap <leader>b :CtrlPBuffer<cr>
nmap <leader>o :CtrlP<cr>
nmap <leader>t :call OpenExploreTab()<cr><c-p>

let g:ctrlp_switch_buffer = 'e'
let g:ctrlp_working_path_mode = 'w'

function CtrlP()
  :CtrlP
endfunction
" autocmd VimEnter * if !argc() | :call CtrlP() | endif

" Tagbar
" Plug 'majutsushi/tagbar'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', '~/.config/nvim/UltiSnips', 'UltiSnips']

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

" Javascript
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'pangloss/vim-javascript'
Plug 'isRuslan/vim-es6'
Plug 'mxw/vim-jsx'
Plug 'alampros/vim-styled-jsx'
let g:jsx_ext_required = 0
let g:syntastic_javascript_checkers = ['eslint']

" HTML
Plug 'othree/html5.vim'

" Typescript
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
autocmd FileType typescript setlocal completeopt+=menu,preview
autocmd FileType typescript nmap <buffer> <Leader>i : <C-u>echo tsuquyomi#hint()<CR>
let g:tsuquyomi_completion_detail = 1

" GraphQl
Plug 'jparise/vim-graphql'

" Dart
Plug 'dart-lang/dart-vim-plugin'

" Ack
Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --nogroup --nocolor --column'
nnoremap <Leader>a :Ack!<Space>

" Solidity
Plug 'tomlion/vim-solidity'

" YouCompleteMe
Plug 'Valloric/YouCompleteMe'
nnoremap <leader>gd :YcmCompleter GoToDeclaration<cr>
nnoremap <leader>gg :YcmCompleter GoToDefinition<cr>
nnoremap <leader>gi :YcmCompleter GoToInclude<cr>
nnoremap <leader>gp :YcmCompleter GoToParent<cr>

" Syntastic
Plug 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
set t_Co=256
let g:airline_theme='bubblegum'

" vim comments
Plug 'tpope/vim-commentary'

" hardmode
Plug 'takac/vim-hardtime'
let g:hardtime_default_on = 1

" sensible
Plug 'tpope/vim-sensible'

" fugitive
Plug 'tpope/vim-fugitive'

" [buffer number] followed by filename:
"set statusline=[%F]\ %t
" for Syntastic messages:
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
" show line#:column# on the right hand side
"set statusline+=%=%l:%c
"

Plug 'tpope/vim-obsession'
augroup ObsessionGroup
  autocmd!
  " When opening a file, start recording the Vim session with its tabs and splits.
  " If Vim is called without arguments and there is already a session file,
  " source it and record the session.
  " Checking 'modified' avoids recording a session when reading from stdin.
  " From https://github.com/tpope/vim-obsession/issues/17
  " !argc() makes sure we only source a session file if Vim was started without arguments.
  " Otherwise we would open an old session instead of opening a file when calling 'vim my_file'.
  " Calling Obsession when the session is being recorded would pause the recording,
  " that's why we check if v:this_session is empty.
  autocmd VimEnter * nested
      \ if !&modified |
      \   if !argc() && filereadable('Session.vim') |
      \   source Session.vim |
      \   echo "Existing session sourced, recording session" |
      \   elseif empty(v:this_session) |
      \     Obsession |
      \     echo "Started new session" |
      \   endif |
      \ endif
augroup END

Plug 'xolox/vim-misc'
" let g:session_autosave_periodic = 1
" let g:session_default_name = fnamemodify(getcwd(), ':t')
" let g:session_autosave = 'yes'
" let g:session_autoload = 'yes'
" let g:session_lock_enabled = 'no'
" let g:session_autosave_silent = 'yes'

" EasyMotion
Plug 'easymotion/vim-easymotion'

call plug#end()
"let base16colorspace=256  " Access colors present in 256 colorspace
"colorscheme materialtheme
"
