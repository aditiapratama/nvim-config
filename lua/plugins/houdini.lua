---@type NvPluginSpec
return {
  "TheBlob42/houdini.nvim",
  event = "VeryLazy",
  opts = {
    mappings = { "jk", "jj" },
    escape_sequences = {
      ["v"] = false,
      t = false,
    },
  },
  config = function(_, opts)
    require("houdini").setup(opts)
  end,
}
