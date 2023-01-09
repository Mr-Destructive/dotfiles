require('destructive.keymap')
require('destructive.lsp_config')
require('destructive.treesitter')
require('destructive.filexplorer')
local M = {}

local augroup = vim.api.nvim_create_augroup('highlight_cmds', {clear = true})

vim.api.nvim_create_autocmd('ColorScheme', {
    pattern = 'rubber',
    group = augroup,
    command = 'highlight String guifg=#FFEB95'
})

local python_augroup = vim.api.nvim_create_augroup('python_format', {clear = true})

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = 'python',
  group = python_augroup,
  callback = function()
    local filename = vim.fn.expand("<afile>")
    vim.cmd("!black filename")
  end
})
require('lualine').setup()
return M
