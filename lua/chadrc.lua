-- NOTE: NvChad Related Options
---@type ChadrcConfig
local M = {}
local highlights = require "configs.highlights"
M.ui = {
  -- transparency = true,
  telescope = { style = "borderless" }, -- borderless / bordered
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "atom", -- default/flat_light/flat_dark/atom/atom_colored
  },
  statusline = {
    theme = "minimal", -- default/vscode/vscode_colored/minimal
    -- default/round/block/arrow separators work only for default statusline theme
    -- round and block will work for minimal theme only
    separator_style = "default",
  },
  -- nvdash = {
  --   load_on_startup = true,
    -- header = {
    --   "           ▄ ▄                   ",
    --   "       ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄     ",
    --   "       █ ▄ █▄█ ▄▄▄ █ █▄█ █ █     ",
    --   "    ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █     ",
    --   "  ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄  ",
    --   "  █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄",
    --   "▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █",
    --   "█▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █",
    --   "    █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█    ",
    -- },
    -- buttons = {
    --   { text = "  Find File", keys = "Spc f f", cmd = "Telescope find_files" },
    --   { text = "󰈚  Recent Files", keys = "Spc f r", cmd = "Telescope oldfiles" },
    --   { text = "󰈭  Find Word", keys = "Spc f w", cmd = "Telescope live_grep" },
    --   { text = "  Find Projects", keys = "Spc f p", cmd = "Telescope projects" },
    --   { text = "  Themes", keys = "Spc f t", cmd = "Telescope themes" },
    --   { text = "  Mappings", keys = "Spc n c", cmd = "NvCheatsheet" },
    -- },
  -- },
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
    "pyright",
    "isort",
    "black",
    "mypy",
    "ruff",
    "prettier",

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
  transparency = true,
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
M.nvdash = {
  load_on_startup = true,
}
return M
