require("destructive.plugins")
require("destructive.color")

map('n', '<leader>w', ':w<CR>',{noremap = false})
map('n', '<leader>q', ':q!<CR>',{noremap = false})
map('n', '<leader>s', ':so %<CR>',{noremap = false})
map('n', '<leader>ev', ':vsplit $MYVIMRC<CR>',{noremap = false})
map('n', '<leader>sv', ':w<CR>:so %<CR>:q<CR>',{noremap = false})
map('n', '<Leader>p', '"+p')
--map('n', '<C-n>', ':NERDTree .<CR>')
map('n', '<C-n>', ':NvimTreeFindFileToggle.<CR>')
map('n', '<leader>gm', "<cmd>lua require('frontmatter').Frontmatter('add',{'image_url', 'series'})<cr>")
map('n', '<Leader>pv', ':vsplit ~/.config/nvim/lua/destructive/plugins.lua<CR>')
map('n', '<Leader>kv', ':vsplit ~/.config/nvim/lua/destructive/keymap.lua<CR>')
map('n', '<Leader>nv', ':vsplit ~/.config/nvim/<CR>')
map('t', '<Esc>', '<C-\\><C-n>')
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- comment and uncomment
--require('Comment').setup({
--    padding = true,
--    sticky = true,
--    ignore = nil,
--    toggler = {
--        line = 'gcc',
--        block = 'gbc',
--    },
--    opleader = {
--        line = 'gc',
--        block = 'gb',
--    },
--    extra = {
--        above = 'gcO',
--        below = 'gco',
--        eol = 'gcA',
--    },
--    mappings = {
--        basic = true,
--        extra = true,
--    },
--    pre_hook = nil,
--    post_hook = nil,
--})
-- vim.keymap.set("v", "<leader>/", function() require('Comment.api').toggle.linewise.current() end,
-- { noremap = true, silent = true })

--require'FTerm'.setup({
--    border = 'double',
--    dimensions  = {
--        height = 0.5,
--        width = 0.5,
--    },
--})

function RunAppropriateCommand()
    local file_extension = vim.fn.expand('%:e')
    local file_name = vim.fn.expand('%:t')

    if file_extension == 'py' then
        if string.lower(string.sub(file_name, 1, 4)) == "test" then
            vim.cmd('lua require("FTerm").run({"pytest ", vim.fn.expand("%")})')
        else
            vim.cmd('lua require("FTerm").run({"python ", vim.fn.expand("%")})')
        end
    elseif file_extension == 'js' then
        vim.cmd('lua require("FTerm").run({"node ", vim.fn.expand("%")})')
    elseif file_extension == 'go' then
        if string.lower(string.sub(file_name, 1, 4)) == "test" then
            vim.cmd('lua require("FTerm").run({"go test ", vim.fn.expand("%:p:h")})')
        else
            vim.cmd('lua require("FTerm").run({"go run ", vim.fn.expand("%")})')
        end
    else
        print("Unsupported file extension.")
    end
end

-- Define a key mapping
vim.api.nvim_set_keymap('n', '<leader>tt', '<CMD>lua RunAppropriateCommand()<CR>', { noremap = true, silent = true })
