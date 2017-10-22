"""""""""""""""""""""""""""""""""""""
"": Start vim-plug setup
" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')
"Plug 'vim-syntastic/syntastic' " syntax checking
Plug 'junegunn/fzf' "interactive Unix filter for command-line
Plug 'junegunn/fzf.vim' "Things you can do with fzf and Vim
Plug 'scrooloose/nerdtree' "file system explorer for the Vim editor
Plug 'Xuyuanp/nerdtree-git-plugin' "NERDTree showing git status flags
Plug 'benmills/vimux' "make interacting with tmux from vim effortless
Plug 'vim-airline/vim-airline' "Lean & mean status/tabline for vim that's light as air.
Plug 'vim-airline/vim-airline-themes' "Themes for airline
Plug 'vimwiki/vimwiki' "A Personal Wiki For Vim
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
" Set encoding to utf8
set encoding=utf8

" For Vim Wiki
set nocompatible
filetype plugin on
syntax on

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

" Use space to switch between buffers
let mapleader = "\<Space>"
nnoremap <leader>j :bn<CR>
nnoremap <leader>k :bp<CR>
nnoremap <leader>0 :buffer 0<CR>
nnoremap <leader>1 :buffer 1<CR>
nnoremap <leader>2 :buffer 2<CR>
nnoremap <leader>3 :buffer 3<CR>
nnoremap <leader>4 :buffer 4<CR>
nnoremap <leader>5 :buffer 5<CR>
nnoremap <leader>6 :buffer 6<CR>
nnoremap <leader>7 :buffer 7<CR>
nnoremap <leader>8 :buffer 8<CR>
nnoremap <leader>9 :buffer 9<CR>


" Theme and Styling
syntax on
set t_Co=256 " enable 256 colors in vim
let base16colorspace=256  " Base16 terminal theme '256' variation

" Set colorschemes for vi-change-color-scheme
let g:vi_change_color_scheme_list = ['default', 'badwolf', 'Benokai', 'molokai', '256-grayvim', 'molokai', 'neverland-darker', 'midnight', 'dracula']
let g:vi_change_color_scheme_default = 0
map <F8> :NextColorScheme<CR>
map <F7> :PrevColorScheme<CR>

" Nerdtree Configuration
map <C-n> :NERDTreeToggle<CR>

" Vim-Airline Configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'minimalist'

" Vim YCM Configuration
let g:ycm_show_diagnostics_ui = 1
let g:ycm_global_ycm_extra_conf = '~/.local/share/nvim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_always_populate_location_list = 1 "will populate vims location list with new diagnostic data.jump with :lnext and :lprevious
" use leader + Up/Down to go to prev/next error, leader + Space goes to first
nnoremap <leader><Space> :ll<CR>
nnoremap <leader><Down> :lnext<CR>
nnoremap <leader><Up> :lprevious<CR>


" Ultisnips Configuration
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsSnippetDir = $HOME."/UltiSnips" "add custom snippets
let g:UltiSnipsSnippetDirectories = [$HOME.'/UltiSnips', 'UltiSnips'] "add custom snippets

