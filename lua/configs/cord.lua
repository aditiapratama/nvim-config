local options = {
  display = {
    show_time = false,
    show_repository = false,
  },
  idle = {
    enable = false
  },
  text={
    -- viewing= "",
    -- editing = "",
    file_browser = "",
    plugin_manager = "",
    lsp_manager = "",
    vcs = "",
    workspace = "",
  },
}

require("cord").setup(options)
