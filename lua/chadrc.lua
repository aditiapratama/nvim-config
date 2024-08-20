-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}
local highlights = require "configs.highlights"
M.ui = {
  transparency = true,
  telescope = { style = "bordered" }, -- borderless / bordered
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
  },
  statusline = {
    theme = "minimal", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "round",
  },
  nvdash = {
    load_on_startup = true,
    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f r", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Find Projects", "Spc f p", "Telescope projects" },
      { "  Themes", "Spc f t", "Telescope themes" },
      { "  Mappings", "Spc n c", "NvCheatsheet" },
    },
  },
}

M.mason = {
  cmd = true,
  -- Use names from mason.nvim
  -- For example, if you want to install "tsserver" you should use "typescript-language-server" in the list below
  pkgs = {
    -- Lua
    "lua-language-server",
    "vim-language-server",
    "stylua",

    -- Web Development
    -- "css-lsp",
    -- "html-lsp",
    -- "typescript-language-server",
    -- "deno",
    -- "vue-language-server",
    -- "tailwindcss-language-server",
    -- "emmet_language_server",
    -- "eslint-lsp",

    -- PHP
    -- "intelephense",

    -- C/C++
    -- "clangd",
    -- "clang-format",

    -- CMake
    -- "neocmakelsp",

    -- Java
    -- "jdtls",

    -- Yaml
    -- "yaml-language-server",

    -- Python
    "basedpyright",

    -- Go
    -- "gopls",

    -- C#
    -- "omnisharp",
    -- "omnisharp-mono",
  },
}

M.lsp = { signature = false }

M.cheatsheet = { theme = "grid" } -- simple/grid

M.base46 = {
  theme = "catppuccin",
  theme_toggle = { "tokyodark", "catppuccin" },
  hl_override = highlights.override,
  hl_add = highlights.add,
  integrations = {
    "notify",
    "dap",
    "trouble",
  },
}
return M
