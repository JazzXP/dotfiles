-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.filetype.add({
  extension = {
    tsx = "typescriptreact",
    jsx = "javascriptreact",
  },
})
