return {
  "folke/tokyonight.nvim",
  config = function()
    require("tokyonight").setup({
      style = "storm",
      -- transparent = true,
      on_colors = function(colors)
        colors.fg_gutter = "#596276"
      end,
    })
  end,
}
