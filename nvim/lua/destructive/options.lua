function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

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
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
  end
end


key_mapper({
  'nnoremap cpp :!c++ % -o %:r && %:r<CR>i',
  'nnoremap c, :!gcc % -o %:r && %:r<CR>',
  'nnoremap py :!python %<cr>',
  'nnoremap go :!go run %<cr>',
  'nnoremap sh :!bash %<CR>'
})

vim.g.mapleader = ' '
local set = vim.opt
set.number = true
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
set.swapfile = false
