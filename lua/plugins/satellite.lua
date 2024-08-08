---@type NvPluginSpec
return{
  "lewis6991/satellite.nvim",
  enabled = false,
  -- lazy = false,
  config = function()
    require("satellite").setup(
    {
      width = 5,
    }
    )
  end,
}
