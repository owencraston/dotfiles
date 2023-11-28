" pecify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes

" Colour theme
Plug 'mhartington/oceanic-next'
# NvTree
Plug 'nvim-tree/nvim-web-devicons' " optional
Plug 'nvim-tree/nvim-tree.lua'
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" gitgutter
Plug 'airblade/vim-gitgutter'
" editor config, in case the .editor config file is provided
Plug 'editorconfig/editorconfig-vim'
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

" add command to copy buffer path
:command! CopyBuffer let @+ = expand('%:p')

" highlight extra whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/
" remove trailing whitespace
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd FileType c,cpp,python,ruby,java,go autocmd BufWritePre <buffer> :call TrimWhiteSpace()
" vim go settings
let g:go_fmt_command = 'goimports'
let g:go_def_mapping_enabled = 0
let g:go_highlight_types = 1
let g:go_doc_keywordprg_enabled = 0
