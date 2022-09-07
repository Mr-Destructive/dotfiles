function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ' '
local set = vim.opt
set.number = true
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true
set.swapfile = false
set.hlsearch = false

function key_mapper(keymaps)
  for _, keymap in ipairs(keymaps) do
    local mode = keymap:sub(1,1)
    local delimiter = " "
    local lhs = ''
    local rhs_parts = {}
    local m = 0
    local options = {noremap = true}
    for matches in (keymap..delimiter):gmatch("(.-)"..delimiter) do
      if m == 1 then
        lhs = matches
      end
      if m >= 2 then
        table.insert(rhs_parts, matches)
      end
      m = m + 1
    end
    rhs = ''
    for _, p in ipairs(rhs_parts) do
      rhs = rhs .. " " .. p
    end
    --print("vim.keymap.set(".."\'"..mode.."\'"..", ".."\'"..lhs.."\'"..", ".."\'"..rhs.."\'"..", "..vim.inspect(options)..")")
    vim.keymap.set(mode, lhs, rhs, options)
  end
end


key_mapper({
  'nnoremap cpp :!c++ % -o %:r && %:r<CR>i',
  'nnoremap c, :!gcc % -o %:r && %:r<CR>',
  'nnoremap py :!python %<cr>',
  'nnoremap go :!go run %<cr>',
  'nnoremap sh :!bash %<CR>'
})
vim.cmd("let g:netrw_altv=1")

vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("GoFormat", {clear=true}),
  pattern = "*.go",
  callback = function()
    vim.cmd("lua vim.lsp.buf.formatting()")
  end,
})
