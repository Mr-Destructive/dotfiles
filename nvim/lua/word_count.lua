-- Initialize variables to store the word count and start time
local word_count = 0
local start_time = os.time()

-- Define the function to update the word count
function UpdateWordCount()
  -- Get the current buffer and its contents
  local buffer = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(buffer, 0, -1, false)

  -- Loop through all the lines and count the number of words
  for _, line in ipairs(lines) do
    for word in string.gmatch(line, "%S+") do
      word_count = word_count + 1
    end
  end

  -- Calculate the elapsed time
  local elapsed_time = os.time() - start_time

  -- Display the word count and speed in the bottom deck
  vim.api.nvim_command("botright copen")
  vim.api.nvim_command("setlocal nobuflisted")
  vim.api.nvim_command("setlocal bufhidden=wipe")
  vim.api.nvim_command("setlocal buftype=nofile")
  vim.api.nvim_command("setlocal noswapfile")
  vim.api.nvim_command("setlocal nowrap")
  vim.api.nvim_command("setlocal nonumber")
  vim.api.nvim_command("setlocal norelativenumber")
  vim.api.nvim_command("setlocal nolist")
  vim.api.nvim_command("setlocal foldcolumn=0")
  vim.api.nvim_command("setlocal cursorline")
  vim.api.nvim_command("setlocal cursorcolumn")
  vim.api.nvim_command("setlocal nofoldenable")
  vim.api.nvim_buf_set_lines(0, -1, false, {"Word count: " .. word_count .. ", Speed: " .. (word_count / elapsed_time) .. " words/sec"})
end

-- Register the function to be called when a buffer is saved
vim.api.nvim_command("augroup WordCount")
vim.api.nvim_command("autocmd!")
vim.api.nvim_command("autocmd BufWritePost <buffer> lua UpdateWordCount()")
vim.api.nvim_command("augroup END")
