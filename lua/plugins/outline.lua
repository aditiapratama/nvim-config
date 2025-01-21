---@type NvPluginSpec
return {
  "hedyhli/outline.nvim",
  cond = false,
  -- lazy = true,
  -- event = "User OutlineOpened",
  cmd = { "Outline", "OutlineOpen" },
  keys = { -- Example mapping to toggle outline
    { "<leader>ol", "<cmd>Outline<CR>", desc = "Toggle outline" },
  },
  -- config = function()
  --   require("outline").setup({})
  -- end,
  opts = {
    -- Your setup opts here
    -- preview_window = {
    --   auto_preview = false,
    --   winhl = 'NormalFloat:',
    -- },
    outline_items = {
      show_symbol_lineno = false,
      show_symbol_details = false,
    },
    outline_window = {
      -- position = "left",
      winhl = "",
      width = 15,
      show_cursor_line = true,
      hide_cursor = true,
      focus_on_open = false,
      -- split_command = 'rightbelow 25vsp'
      -- wrap = true,
    },
    keymaps = {
      peek_location = {
        "<LeftRelease>",
      },
    },
    -- preview_window = {
    --   open_hover_on_preview = true,
    -- },
    -- symbols = {
    --   filter = {
    --     default = { "String", "Variable", exclude = true },
    --     python = { "Function", "Class" },
    -- },
    -- },
  },
}
