require("packer")
vim.opt.completeopt={"menu","menuone","noselect"}

local cmp = require'cmp'
local navic = require("nvim-navic")

 cmp.setup({
   snippet = {
     expand = function(args)
       require('luasnip').lsp_expand(args.body)
     end,
   },
   window = {
     -- completion = cmp.config.window.bordered(),
     -- documentation = cmp.config.window.bordered(),
   },
   mapping = cmp.mapping.preset.insert({
     ['<C-b>'] = cmp.mapping.scroll_docs(-4),
     ['<C-f>'] = cmp.mapping.scroll_docs(4),
     ['<C-Space>'] = cmp.mapping.complete(),
     ['<C-e>'] = cmp.mapping.abort(),
     ['<CR>'] = cmp.mapping.confirm({ select = true }), 
   }),
   sources = cmp.config.sources({
     { name = 'nvim_lsp' },
     { name = 'luasnip' }, -- For luasnip users.
   }, {
     { name = 'buffer' },
   })
 })

 -- Set configuration for specific filetype.
 cmp.setup.filetype('gitcommit', {
   sources = cmp.config.sources({
     { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
   }, {
     { name = 'buffer' },
   })
 })

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspconfig").pyright.setup{
 capabilities = capabilities,
 on_attach = function(client, bufnr)
   vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
   vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
   vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, {buffer=0})
   vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
   navic.attach(client, bufnr)
   vim.o.winbar = " %{%v:lua.vim.fn.expand('%F')%}  %{%v:lua.require'nvim-navic'.get_location()%}"
--    vim.cmd([[
--      augroup Python_foramt
--        autocmd!
--        autocmd BufWritePost *py silent :!black %
--      augroup END
--    ]])
--local augroup = vim.api.nvim_create_augroup('python_format', {clear = true})
--
--vim.api.nvim_create_autocmd('BufWritePost', {
--  pattern = 'python',
--  group = augroup,
--  command = vim.cmd('!black %'),
--})
 end,
}

require("lspconfig").gopls.setup{
 capabilities = capabilities,
 on_attach = function(client, bufnr)
   vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
   vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer=0})
   vim.keymap.set("n", "<leader>df", vim.diagnostic.goto_next, {buffer=0})
   vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer=0})
   navic.attach(client, bufnr)
   vim.o.winbar = " %{%v:lua.vim.fn.expand('%F')%}  %{%v:lua.require'nvim-navic'.get_location()%}"
 end,
}

local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

--require("flutter-tools").setup{} 
--local builtin = require('telescope.builtin')
--vim.keymap.set('n', 'ff', builtin.find_files, {})
--vim.keymap.set('n', 'fg', builtin.live_grep, {})
--vim.keymap.set('n', 'fb', builtin.buffers, {})
--vim.keymap.set('n', 'fh', builtin.help_tags, {})

--vim.o.winbar = " %{%v:lua.vim.fn.expand('%F')%}  %{%v:lua.require'nvim-navic'.get_location()%}"
