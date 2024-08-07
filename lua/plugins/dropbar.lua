---@type NvPluginSpec
--- Dropbar
return {
  "Bekaboo/dropbar.nvim",
  -- optional, but required for fuzzy finder support
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
  },
  lazy = false, -- important!
  config = function()
    require("dropbar").setup()
  end,

}
