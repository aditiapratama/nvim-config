local options = {
  outline_window = {
    width = 15,
    -- wrap = true,
    hide_cursor = true,
    focus_on_open = false,
  },
  keymaps = {
    peek_location = {
      "<LeftRelease>",
    },
  },
  preview_window = {
    open_hover_on_preview = true,
  },
}

require("outline").setup(options)
