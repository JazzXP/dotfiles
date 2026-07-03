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

local function nav(wincmd, dir)
  local prev = vim.api.nvim_get_current_win()
  vim.cmd("wincmd " .. wincmd)
  if vim.api.nvim_get_current_win() ~= prev then
    return
  end

  if vim.env.HERDR_PANE_ID and vim.env.HERDR_PANE_ID ~= "" then
    local herdr = vim.env.HERDR_BIN_PATH or "herdr"
    vim.fn.system({ herdr, "pane", "focus", "--direction", dir, "--current" })
  elseif vim.env.TMUX and vim.env.TMUX ~= "" then
    local tmux = { left = "Left", down = "Down", up = "Up", right = "Right" }
    pcall(vim.cmd, "TmuxNavigate" .. tmux[dir])
  end
end

-- Simply define them here. This will override LazyVim's defaults.
vim.keymap.set("n", "<C-h>", function()
  nav("h", "left")
end, { desc = "Navigate left" })
vim.keymap.set("n", "<C-j>", function()
  nav("j", "down")
end, { desc = "Navigate down" })
vim.keymap.set("n", "<C-k>", function()
  nav("k", "up")
end, { desc = "Navigate up" })
vim.keymap.set("n", "<C-l>", function()
  nav("l", "right")
end, { desc = "Navigate right" })
