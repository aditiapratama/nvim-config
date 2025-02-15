---@type NvPluginSpec
-- NOTE: Surround "", {}, '', ()
return {
  "kylechui/nvim-surround",
  event = { "bufReadPost", "bufNewFile" },
  opts = {},
}
