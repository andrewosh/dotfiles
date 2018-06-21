set nocompatible

filetype plugin indent on
syntax on

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

source ~/dotfiles/config.vim
source ~/dotfiles/plugins.vim


if $FUCHSIA_DIR != ""
    source $FUCHSIA_DIR/scripts/vim/fuchsia.vim
endif
