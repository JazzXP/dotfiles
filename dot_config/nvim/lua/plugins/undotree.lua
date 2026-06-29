return {
  "jiaoshijie/undotree",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    require("undotree").setup()

    -- Register keymap through which-key so icons work
    local wk = require("which-key")

    wk.add({
      {
        "<leader>U",
        function()
          require("undotree").toggle()
        end,
        desc = "Undotree",
        icon = "",
      },
    })
  end,
}
