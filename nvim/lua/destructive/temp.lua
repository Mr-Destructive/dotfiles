local api = vim.api

-- Function to get the current code context from the LSP
local function get_code_context()
  -- Use the LSP API to get the current code context
  local context = api.nvim_lsp_buf_get_context()
  if context == nil then
    -- If no context is available, return an empty string
    return ''
  else
    -- If a context is available, return it as a string
    return tostring(context)
  end
end

-- Function to update the statusline/winbar with the current code context
local function update_statusline()
  -- Get the current code context
  local context = get_code_context()
  if context == '' then
    -- If no context is available, hide the statusline/winbar
    api.nvim_set_var('statusline', '')
  else
    -- If a context is available, show it in the statusline/winbar
    api.nvim_set_var('statusline', 'Code context: '..context)
  end
end

-- Update the statusline/winbar whenever the cursor moves to a new line
api.nvim_buf_attach(api.nvim_get_current_buf(), false, {
  on_lines = update_statusline,
  on_detach = update_statusline
})
