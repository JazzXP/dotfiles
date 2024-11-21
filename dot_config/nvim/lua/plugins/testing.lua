return {
  "nvim-neotest/neotest",
  dependencies = {
    "marilari88/neotest-vitest",
    "nvim-neotest/nvim-nio",
  },
  opts = {
    adapters = {
      ["neotest-vitest"] = {
        vitestCommand = "npx vitest run --coverage",
        filter_dir = function(name, rel_path, root)
          return name ~= "node_modules"
        end,
      },
    },
  },
}
