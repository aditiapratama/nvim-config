-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}
local highlights = require "configs.highlights"
M.ui = {
    -- transparency = true,
  statusline = {
    theme = "minimal",
    separator_style = "round",
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

M.cheatsheet = { theme = "grid" } -- simple/grid

M.base46 = {
  theme = "catppuccin",
  theme_toggle = { "onedark", "catppuccin" },
  hl_override = highlights.override,
  hl_add = highlights.add,
  integrations = {
    "notify",
    "dap",
    "trouble",
  },
}
return M
