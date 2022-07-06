function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end
vim.g.mapleader = ' '
local set = vim.opt

set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true

map('n', '<Leader>w', ':w<CR>')
map('n', '<Leader>p', '"+p')
map('n', '<Leader>q', ':q!<CR>')
map('n', '<Leader>ev', ':vsplit $MYVIMRC<CR>')
map('n', '<Leader>ev', ':vsplit $MYVIMRC<CR>')
map('n', '<Leader>sv', ':w<cr>:so %<cr>:q<cr>')
map('n', '<C-n>', ':NERDTree .<CR>')
