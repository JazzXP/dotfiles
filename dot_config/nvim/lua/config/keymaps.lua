-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- double ; in insert mode will automattically add a semicolon at the end of the line if there isn't one already
vim.keymap.set("i", ";;", function()
  local line = vim.api.nvim_get_current_line()
  local trimmed = line:gsub("%s+$", "")

  if trimmed:len() > 0 and string.sub(trimmed, -1) ~= ";" then
    trimmed = trimmed .. ";"
  end
  vim.api.nvim_set_current_line(trimmed)
end, { noremap = true })
