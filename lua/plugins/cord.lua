---@type NvPluginSpec
return {
  "vyfor/cord.nvim",
  build = "./build",
  event = {"bufReadPost", "bufNewFile"},
  opts = {},
  config = function()
    require("cord").setup {
      display = {
        show_time = false,
        show_repository = false,
      },
      idle = {
        enable = false,
      },
      text = {
        -- viewing= "",
        -- editing = "",
        file_browser = "",
        plugin_manager = "",
        lsp_manager = "",
        vcs = "",
        workspace = "",
      },
    }
  end,
}
