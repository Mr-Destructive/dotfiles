vim.cmd("colorscheme dracula")
vim.api.nvim_command([[
    augroup ChangeBackgroudColour
        autocmd colorscheme * :hi normal guibg=#00000f guifg=#ffffff
    augroup END
]])
vim.o.termguicolors = true
vim.cmd [[silent! colorscheme snow]]
