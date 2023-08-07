vim.o.termguicolors = true
vim.api.nvim_command([[
 set background = "dark"
]])
-- let $NVIM_TUI_ENABLE_TRUE_COLOR=1
-- ]])
-- vim.api.nvim_command([[
--    augroup ChangeBackgroudColour
--        autocmd colorscheme * :hi normal guibg=#000030 guifg=#ffffff
--        autocmd colorscheme * :hi Directory guifg=#000030 ctermfg=#ffffff
--    augroup END

vim.cmd("colorscheme catppuccin-mocha")
vim.cmd.colorscheme "catppuccin"
