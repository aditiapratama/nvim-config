---@type NvPluginSpec
return {
  "TheBlob42/houdini.nvim",
  event = "VeryLazy",
  opts = {
      mappings = {"jk","jj"},
  },
  config = function(_, opts)
    require("houdini").setup(opts)
  end,
}
