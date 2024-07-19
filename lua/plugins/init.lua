return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "vscode-neovim/vscode-multi-cursor.nvim",
  },
  {
    "folke/flash.nvim",
  },
  {
    "mg979/vim-visual-multi",
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "fedepujol/move.nvim",
    opts = {
      -- config
    },
    event = "VeryLazy",
    config = function()
      require "configs.move"
    end,
  },
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
      },
    },
  },
  --
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
      },
    },
  },
  {
    "vyfor/cord.nvim",
    build = "./build",
    event = "VeryLazy",
    opts = {},
    config = function()
      require "configs.cord"
    end,
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python", --optional
      { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    lazy = false,
    branch = "regexp", -- This is the regexp branch, use this for the new version
    config = function()
      require("venv-selector").setup()
    end,
    keys = {
      { ",v", "<cmd>VenvSelect<cr>" },
    },
  },
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      -- Your setup opts here
      symbols = {
        filter = {
          default = { "String", exclude = true },
          python = { "Function", "Class" },
        },
      },
    },
    config = function()
      require "configs.outline"
    end,
  },
  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvimtools/hydra.nvim",
    },
    opts = {},
    cmd = {
      "MCstart",
      "MCvisual",
      "MCclear",
      "MCpattern",
      "MCvisualPattern",
      "MCunderCursor",
    },
    keys = {
      {
        mode = { "v", "n" },
        "<Leader>m",
        "<cmd>MCstart<cr>",
        desc = "Create a selection for selected text or word under the cursor",
      },
    },
  },
  {
    "smoka7/hop.nvim",
    version = "*",
    opts = {
      multi_windows = true,
      keys = "etovxqpdygfblzhckisuran",
      uppercase_labels = true,
    },
    keys = {
      {
        "<leader>fj",
        function()
          require("hop").hint_words()
        end,
        mode = { "n", "x", "o" },
      },
    },
  },
  {
    "b0o/blender.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.blender"
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "grapp-dev/nui-components.nvim",
      "mfussenegger/nvim-dap", -- Optional, for debugging with DAP
      "LiadOz/nvim-dap-repl-highlights", -- Optional, for syntax highlighting in the DAP REPL
    },
    keys = {
      { "<leader>bl", "<cmd>BlenderLaunch<cr>", desc = "launch Blender" },
      { "<leader>bm", "<cmd>BlenderManage<cr>", desc = "Manage Blender" },
      { "<leader>br", "<cmd>BlenderReload<cr>", desc = "Reload Blender" },
      { "<leader>bu", "<cmd>BlenderUnwatch<cr>", desc = "Unwatch Blender" },
      { "<leader>bw", "<cmd>BlenderWatch<cr>", desc = "Watch Blender" },
    },
  },
  {
    "TheBlob42/houdini.nvim",
    event = "VeryLazy",
    config = function()
      require "configs.houdini"
    end,
  },
  {
    "charludo/projectmgr.nvim",
    lazy = false, -- important!
    config = function()
      require "configs.projectmgr"
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    event = "VeryLazy",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
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
  {
    "KronsyC/nvim-license",
    opts = function()
      return {
        name = "Aditia A. Pratama",
        -- Optional
        year = "2024",
      }
    end,

    cmd = {
      "License",
      "LicenseHeader",
      "AutoLicense",
    },
    dependencies = {
      { "numToStr/Comment.nvim" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    config = function()
      require "configs.treesitter-context"
    end,
  },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy"
  },
  {
    "farmergreg/vim-lastplace",
    event="VeryLazy",
  }
}
