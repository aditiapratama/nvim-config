return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  opts = {
    window = {
      width = 180,
      options = {
        foldcolumn = "1", -- disable fold column,
      },
    },
    plugins = {
      gitsigns = true,
      tmux = true,
      alacritty = { enabled = false, font = "16" },
    },
  },
  keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
}
