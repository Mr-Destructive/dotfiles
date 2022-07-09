vim.api.nvim_command([[
    augroup ChangeBackgroudColour
        autocmd colorscheme * :hi normal guibg=#000030 guifg=#ffffff
        autocmd colorscheme * :hi Directory guifg=#00FFFF ctermfg=#ffffff
    augroup END
]])
vim.o.termguicolors = true
vim.cmd [[silent! colorscheme dracula]]
