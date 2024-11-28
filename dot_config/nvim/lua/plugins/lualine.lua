local codestats = require("codestats")
local xp = function()
  return codestats.get_xp(0) .. "/" .. codestats.get_xp() -- current buf language xp
end
return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections.lualine_z = {}
      opts.sections.lualine_z = {
        "location",
        "filetype",
        {
          xp,
          fmt = function(s)
            return s and (s ~= "0/0" or nil) and s .. "xp"
          end,
        },
      }
    end,
  },
}
