---@type NvPluginSpec
-- NOTE: Default Plugins
return {
  {
    "NvChad/nvterm",
    -- enabled = false,
  },
  {
    "NvChad/ui",
    config = function()
      require "nvchad"
    end,
  },
  { "nvchad/volt" },
  {
    "nvchad/minty",
  },
}
