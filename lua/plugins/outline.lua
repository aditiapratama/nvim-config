---@type NvPluginSpec
return {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = { -- Example mapping to toggle outline
    { "<leader>ol", "<cmd>Outline<CR>", desc = "Toggle outline" },
  },
  opts = {
    -- Your setup opts here
    preview_window = {
      auto_preview = false,
      winhl = 'NormalFloat:',
    },
    outline_window = {
      winhl = "",
      width = 15,
      show_cursor_line = true,
      hide_cursor = true,
      focus_on_open = false,
    },
    keymaps = {
      peek_location = {
        "<LeftRelease>",
      },
    },
    -- preview_window = {
    --   open_hover_on_preview = true,
    -- },
    symbols = {
      filter = {
        default = { "String", "Variable", exclude = true },
        python = { "Function", "Class" },
      },
    },
  },
}
