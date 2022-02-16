Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='luna'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_inactive_collapse=1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
" let g:airline_left_sep='>'
" let g:airline_right_sep='<'
let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline#extensions#tabline#enabled = 1

