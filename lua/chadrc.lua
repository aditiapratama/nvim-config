-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}
local highlights = require "configs.highlights"
M.ui = {
  theme = "doomchad",
  theme_toggle = { "nord", "doomchad" },
  hl_override = highlights.override,
  hl_add = highlights.add,
  -- transparency = true,
  statusline = {
    theme = "vscode_colored",
  },
  nvdash = {
    load_on_startup = true,
  },
  cmp = {
    icons = true,
    lspkind_text = true,
    style = "default", -- default/flat_light/flat_dark/atom/atom_colored
  },
  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.base46 = {
  integrations = {
    "notify",
    "dap",
    "trouble",
  },
}
return M
