---@type NvPluginSpec
return {
  "TheBlob42/houdini.nvim",
  event = {"bufReadPost", "bufNewFile"},
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
