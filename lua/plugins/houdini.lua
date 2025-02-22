---@type NvPluginSpec
return {
  "TheBlob42/houdini.nvim",
  event = { "bufReadPost", "bufNewFile" },
  opts = {
    mappings = { "jk", "jj" },
    escape_sequences = {
      ["v"] = false, -- normal visual
      ["V"] = false, -- visual line mode
      [""] = false, -- visual block mode
      t = false,
    },
  },
  config = function(_, opts)
    require("houdini").setup(opts)
  end,
}
