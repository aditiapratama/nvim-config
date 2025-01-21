---@type NvPluginSpec
return {
  "lewis6991/satellite.nvim",
  cond = false,
  -- lazy = false,
  config = function()
    require("satellite").setup {
      width = 5,
    }
  end,
}
