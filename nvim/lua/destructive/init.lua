local M = {}

local augroup = vim.api.nvim_create_augroup('highlight_cmds', {clear = true})

vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = 'rubber',
  group = augroup,
  command = 'highlight String guifg=#FFEB95'
})

M.imap = function(tbl)
  vim.keymap.set("i", tbl[1], tbl[2], tbl[3])
end

M.nmap = function(tbl)
  vim.keymap.set("n", tbl[1], tbl[2], tbl[3])
end

return M

