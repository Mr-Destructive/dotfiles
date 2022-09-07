require('destructive.keymap')
require('destructive.lsp_config')
local M = {}

local augroup = vim.api.nvim_create_augroup('highlight_cmds', {clear = true})

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = 'rubber',
  group = augroup,
  command = 'highlight String guifg=#FFEB95'
})

return M
