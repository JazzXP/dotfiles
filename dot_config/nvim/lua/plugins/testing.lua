return {
  "nvim-neotest/neotest",
  dependencies = {
    "marilari88/neotest-vitest",
    -- "nvim-neotest/nvim-nio",
  },
  opts = {
    log_level = vim.log.levels.DEBUG,
    adapters = {
      ["neotest-vitest"] = {
        vitestCommand = "npx vitest run --coverage",
        vitestConfigPath = vim.fn.getcwd() .. "/vitest.config.ts",
        filter_dir = function(name, rel_path, root)
          return name ~= "node_modules"
        end,
        cwd = function(path)
          return vim.fn.getcwd()
        end,
      },
    },
  },
}
