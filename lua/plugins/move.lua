---@type NvPluginSpec
return {
  "fedepujol/move.nvim",
  opts = {},
  event = { "bufReadPost", "bufNewFile" },
  config = function()
    require("move").setup {
      line = {
        enable = true, -- Enables line movement
        indent = true, -- Toggles indentation
      },
      block = {
        enable = true, -- Enables block movement
        indent = true, -- Toggles indentation
      },
      word = {
        enable = true, -- Enables word movement
      },
      char = {
        enable = false, -- Enables char movement
      },
    }
  end,
}
