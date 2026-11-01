return {
  "baggiponte/rex-navigator.nvim",
  main = "rex-navigator",
  lazy = false,
  opts = {
    mappings = false,
  },
  keys = function()
    return {
      { "<C-h>", "<Plug>(RexNavigateLeft)", desc = "Rex Navigate Left" },
      { "<C-l>", "<Plug>(RexNavigateRight)", desc = "Rex Navigate Right" },
      { "<C-j>", "<Plug>(RexNavigateDown)", desc = "Rex Navigate Down" },
      { "<C-k>", "<Plug>(RexNavigateUp)", desc = "Rex Navigate Up" },
    }
  end,
}
