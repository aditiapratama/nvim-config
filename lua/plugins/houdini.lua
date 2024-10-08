---@type NvPluginSpec
return {
  "TheBlob42/houdini.nvim",
  event = "VeryLazy",
  opts = {
    mappings = { "jk", "jj" },
    escape_sequences = {
      ["v"] = false,
    },
  },
  config = function(_, opts)
    require("houdini").setup(opts)
  end,
}
