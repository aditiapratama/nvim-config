---@type NvPluginSpec
return {
  "charludo/projectmgr.nvim",
  lazy = false, -- important!
  config = function()
    require("projectmgr").setup()
  end,
}
