" pecify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes

" Colour theme
Plug 'ayu-theme/ayu-vim'
" Nerdtree 
Plug 'scrooloose/nerdtree',
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" lightline
Plug 'itchyny/lightline.vim'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Initialize plugin system
call plug#end()

" Custom configs
syntax on
set clipboard=unnamed
set encoding=utf-8

" relative/absolute line numbers hybrid
:set number relativenumber
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set termguicolors     " enable true colors support
let ayucolor='mirage' " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

" lightline colour
let g:lightline = {'colorscheme': 'wombat',}

" autoload nerdtree
autocmd vimenter * NERDTree
