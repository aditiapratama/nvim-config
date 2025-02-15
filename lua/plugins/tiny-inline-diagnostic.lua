---@type NvPluginSpec
return {
  "rachartier/tiny-inline-diagnostic.nvim",
  enabled = false,
  -- event = "LspAttach", -- Or `VeryLazy`
  config = function()
    require("tiny-inline-diagnostic").setup {}
  end,
}
