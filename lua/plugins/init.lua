---@type NvPluginSpec
-- NOTE: Default Plugins
return {
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- "lua-language-server", "stylua",
        -- "html-lsp", "css-lsp" , "prettier"
        "pyright",
        "black",
        "isort",
        "mypy",
        "ruff",
        "debugpy",
        "cspell",
        "fish",
        "fish_indent",
        "mdformat",
        "prettier",
        "shfmt",
        "stylua",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "python",
        "toml",
      },
    },
  },
  {
    "nvimtools/none-ls.nvim",
    ft = { "python" },
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      require "configs.null-ls"
    end,
  },
}
