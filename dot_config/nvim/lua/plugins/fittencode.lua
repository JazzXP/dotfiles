if true then
  return {}
end
return {
  "luozhiya/fittencode.nvim",
  config = function()
    require("fittencode").setup()
  end,
}
