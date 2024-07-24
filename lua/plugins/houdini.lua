return {
  "TheBlob42/houdini.nvim",
  event = "VeryLazy",
  config = function()
    require("houdini").setup()
  end,
}
