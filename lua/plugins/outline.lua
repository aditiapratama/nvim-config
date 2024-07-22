return {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = { -- Example mapping to toggle outline
    { "<leader>ol", "<cmd>Outline<CR>", desc = "Toggle outline" },
  },
  opts = {
    -- Your setup opts here
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
    -- preview_window = {
    --   open_hover_on_preview = true,
    -- },
    symbols = {
      filter = {
        default = { "String", exclude = true },
        python = { "Function", "Class" },
      },
    },
  },
}
