" pecify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes

" Colour theme
Plug 'mhartington/oceanic-next'
" Nerdtree 
Plug 'scrooloose/nerdtree',
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" ctrlp
Plug 'ctrlpvim/ctrlp.vim'
" gitgutter
Plug 'airblade/vim-gitgutter'
" linting
Plug 'w0rp/ale'
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
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext " set colour scheme

" enable powerline fonts
let g:airline_powerline_fonts = 1
" airline themes
let g:airline_theme='oceanicnext'

" autoload nerdtree
autocmd vimenter * NERDTree
" close nvim if nerdtree is the only open buffer
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" hide .pyc files
let NERDTreeIgnore = ['\.pyc$']
