require('destructive')
require('destructive/packer')
require('destructive/keymap')
require('destructive/color')

vim.g.mapleader = ' '
local set = vim.opt

set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true

vim.keymap.set('n', '<Leader>w', ':w<CR>')
vim.keymap.set('n', '<Leader>p', '"+p')
vim.keymap.set('n', '<Leader>q', '":q!')
vim.keymap.set('n', '<Leader>ev', ':vsplit $MYVIMRC<CR>')
vim.keymap.set('n', '<Leader>ev', ':vsplit $MYVIMRC<CR>')
vim.keymap.set('n', '<Leader>sv', ':w<cr>:so %<cr>:q<cr>')
vim.keymap.set('n', '<C-n>', ' :NERDTree<CR>')

