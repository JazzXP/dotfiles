return {
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    opts = {
      after_palette = function(palette)
        local U = require("nordic.utils")
        palette.bg_visual = U.blend(palette.orange.base, palette.bg, 0.15)
        palette.fg_sidebar = U.blend(palette.fg, palette.bg, 0.3)
      end,
      swap_backgrounds = true,
      cursorline = {
        theme = "light",
        blend = 0.2,
      },
    },
  },
}
