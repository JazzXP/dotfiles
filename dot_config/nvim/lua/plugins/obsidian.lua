return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    -- refer to `:h file-pattern` for more examples
    "BufReadPre "
      .. vim.fn.expand("~")
      .. "/Documents/Obsidian/Personal",
    "BufNewFile " .. vim.fn.expand("~") .. "/Documents/Obsidian/Personal/*.md",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Documents/Obsidian/Personal",
      },
    },
    notes_subdir = "98-Inbox",
    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "99-Meta/Daily Notes",
      -- Optional, if you want to change the date format for the ID of daily notes.
      date_format = "%Y-%m-%d",
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = "{{date}}.md",
    },
    picker = {
      name = "fzf-lua",
    },
    -- see below for full list of options 👇
  },
}
