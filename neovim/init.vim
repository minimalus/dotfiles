"""""""""""""""""""""""""""""""""""""
set encoding=utf8

"": Start vim-plug setup
" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'vim-syntastic/syntastic' " syntax checking
Plug 'junegunn/fzf' "interactive Unix filter for command-line
Plug 'junegunn/fzf.vim' "Things you can do with fzf and Vim
Plug 'scrooloose/nerdtree' "file system explorer for the Vim editor
Plug 'benmills/vimux' "make interacting with tmux from vim effortless
"Plug 'junegunn/vim-easy-align'
Plug 'SirVer/ultisnips' "ultimate solution for snippets in Vim
Plug 'honza/vim-snippets' "Snippets are separated from the engine
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' } "fast, as-you-type, fuzzy-search code completion engine for Vim
Plug 'flazz/vim-colorschemes' "one stop shop for vim colorschemes.
Plug 'minimalus/vi-change-color-scheme' "change list of colorschemes.

" Initialize plugin system
call plug#end()


"""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""
" Do not wrap text
set nowrap

" Show linenumbers
set number

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab " converts tabs to spaces
autocmd Filetype cpp setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab

" Always display the status line
set laststatus=2

" Enable highlighting of the current line
set cursorline

" Theme and Styling 
syntax on
colorscheme badwolf 
set t_Co=256
let base16colorspace=256  " Access colors present in 256 colorspace

" Set colorschemes for vi-change-color-scheme
let g:vi_change_color_scheme_list = ['default', 'badwolf', 'Benokai', 'molokai', '256-grayvim', 'molokai', 'neverland-darker', 'midnight', 'dracula']
let g:vi_change_color_scheme_default = 0
map <F8> :NextColorScheme<CR>
map <F7> :PrevColorScheme<CR>


" Vim-Airline Configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 
let g:airline_theme='hybrid'
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 



