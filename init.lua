-- init.lua

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Specify a directory for plugins
vim.call('plug#begin', '~/.config/nvim/plugged')

-- Plugins
vim.call('plug#', 'mhartington/oceanic-next')
vim.call('plug#', 'nvim-tree/nvim-web-devicons') -- optional for nvim-tree
vim.call('plug#', 'nvim-tree/nvim-tree.lua')
vim.call('plug#', 'vim-airline/vim-airline')
vim.call('plug#', 'vim-airline/vim-airline-themes')
vim.call('plug#', 'airblade/vim-gitgutter')
vim.call('plug#', 'editorconfig/editorconfig-vim')

-- Initialize plugin system
vim.call('plug#end')

-- Basic settings
vim.o.syntax = 'on'
vim.o.clipboard = 'unnamed'
vim.o.encoding = 'utf-8'

-- Relative/Absolute line numbers hybrid
vim.wo.number = true
vim.wo.relativenumber = true

-- Autocommands for toggling line numbers
vim.api.nvim_create_autocmd({"BufEnter", "FocusGained", "InsertLeave"}, {
    pattern = '*',
    command = 'set relativenumber',
})
vim.api.nvim_create_autocmd({"BufLeave", "FocusLost", "InsertEnter"}, {
    pattern = '*',
    command = 'set norelativenumber',
})


-- Color scheme settings
vim.o.termguicolors = true
vim.g.oceanic_next_terminal_bold = 1
vim.g.oceanic_next_terminal_italic = 1
vim.cmd 'colorscheme OceanicNext'

-- Airline settings
vim.g.airline_powerline_fonts = 1
vim.g.airline_theme = 'oceanicnext'


-- Add command to copy buffer path
vim.cmd [[ command! CopyBuffer let @+ = expand('%:p') ]]

-- Whitespace and formatting settings
vim.cmd [[
    highlight ExtraWhitespace ctermbg=red guibg=red
    au ColorScheme * highlight ExtraWhitespace guibg=red
    au BufEnter * match ExtraWhitespace /\s\+$/
    au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    au InsertLeave * match ExtraWhiteSpace /\s\+$/
]]

-- Function to remove trailing whitespace
vim.cmd [[
    function! TrimWhiteSpace()
        %s/\s\+$//e
    endfunction
]]

-- Autocommand for trimming whitespace
vim.api.nvim_create_autocmd({'FileType'}, {
    pattern = {'c', 'cpp', 'python', 'ruby', 'java', 'go'},
    command = 'autocmd BufWritePre <buffer> :call TrimWhiteSpace()',
})

-- Go settings
vim.g.go_fmt_command = 'goimports'
vim.g.go_def_mapping_enabled = 0
vim.g.go_highlight_types = 1
vim.g.go_doc_keywordprg_enabled = 0

-- Nvim-tree settings
-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()
