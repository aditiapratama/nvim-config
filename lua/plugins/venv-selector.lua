-- NOTE: For switching between Python venv
return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    "mfussenegger/nvim-dap-python", --optional
    { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
  },
  branch = "regexp",
  cmd = { "VenvSelect", "VenvSelectCached" },
  init = function()
    vim.keymap.set("n", "<leader>vs", "<cmd>VenvSelect<cr>", { desc = "Venv Selector | Select Python venv" })
  end,
  opts = {},
  config = function(_, opts)
    require("venv-selector").setup(opts)
  end,
}
