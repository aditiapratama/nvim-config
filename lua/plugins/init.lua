---@type NvPluginSpec
-- NOTE: Default Plugins
return {
  -- NvChad Default Terminal
  {
    "NvChad/nvterm",
    -- enabled = false,
  },
  {
    "NvChad/ui",
  },
  { "nvchad/volt" },
  {
    "nvchad/minty",
  },
  -- {
  --   "williamboman/mason.nvim",
  --   opts = {},
  -- },
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = {
  --     ensure_installed = {
  --       "vim",
  --       "lua",
  --       "vimdoc",
  --       "html",
  --       "css",
  --       "python",
  --       "toml",
  --     },
  --   },
  -- },
  -- {
  --   "nvimtools/none-ls.nvim",
  --   enabled = false,
  --   -- lazy=false,
  --   ft = { "python" },
  --   dependencies = {
  --     "nvimtools/none-ls-extras.nvim",
  --   },
  --   config = function()
  --     require "configs.null-ls"
  --   end,
  -- },
}
