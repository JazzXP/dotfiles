return {
  "folke/tokyonight.nvim",
  config = function()
    require("tokyonight").setup({
      style = "moon",
      transparent = true,
      on_colors = function(colors)
        colors.fg_gutter = "#596276"
      end,
    })
  end,
}
