---@type NvPluginSpec
-- NOTE: Extend a/i neovim powers
return {
  "echasnovski/mini.ai",
  event = { "bufReadPost", "bufNewFile" },
  opts = {},
}
