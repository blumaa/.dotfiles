" ------------------------------------------------------------------------------
" General Settings
" ------------------------------------------------------------------------------
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
set expandtab
set shiftwidth=4
set tabstop=4
set hidden
set signcolumn=yes:2
set number
set termguicolors
set undofile
set spell
set title
set ignorecase
set smartcase
set wildmode=longest:full,full
set nowrap
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set scrolloff=8
set sidescrolloff=8

" ------------------------------------------------------------------------------
" Key maps 
" ------------------------------------------------------------------------------

" leader key
let mapleader = "\<space>"

" reselect visual selection after indenting
noremap < <gv
noremap > >gv

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" allow ft to open a terminal session
let g:floaterm_keymap_new = '<Leader>ft'

" after searching for matching terms, clear highlight
nnoremap <esc> :noh <CR>

" ------------------------------------------------------------------------------
" Plugins 
" ------------------------------------------------------------------------------

let data_dir = has('nvim') ? stdpath('data').'/site' : '~/.vim'
if empty(glob(data_dir.'/autoload/plug.vim'))
    silent execute '!curl -flo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir.'/plugins')

source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/commentary.vim
source ~/.config/nvim/plugins/coc.vim
source ~/.config/nvim/plugins/dracula.vim
source ~/.config/nvim/plugins/editorconfig.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/fzf.vim
source ~/.config/nvim/plugins/nerdtree.vim
source ~/.config/nvim/plugins/polyglot.vim
source ~/.config/nvim/plugins/surround.vim

call plug#end()
doautocmd User PlugLoaded

