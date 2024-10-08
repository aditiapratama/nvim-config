---@type NvPluginSpec
---NOTE: Automatically Import updates on module/package rename
return {
  "alexpasmantier/pymple.nvim",
  -- enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    -- optional (nicer ui)
    "stevearc/dressing.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  build = ":PympleBuild",
  config = function()
    require("pymple").setup()
  end,
}
