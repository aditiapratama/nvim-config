---@type NvPluginSpec
-- NOTE: For switching between Python venv
return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    "mfussenegger/nvim-dap-python", --optional
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  },
  lazy = false,
  -- branch = "regexp",
  config = function()
    require("venv-selector").setup {
      pyenv_path = "/home/aditia/.pyenv/versions",
    }
  end,
  keys = {
    { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Venv Selector | Select Python venv" },
  },
}
