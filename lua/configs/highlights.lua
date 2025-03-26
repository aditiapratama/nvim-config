-- NOTE: NvChad Related Highlights
-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  AlphaHeader = { fg = "blue" },
  CursorLine = {
    bg = "black2",
  },
  -- Italic start here
-- imports
  Include = {
    italic = true,
  },
  -- for, while loops
  Repeat = {
    italic = true,
  },
  -- if statements
  Conditional = {
    italic = true,
  },
  -- class, with, as keywords
  ["@keyword"] = {
    italic = true,
  },
  -- function keyword
  ["@keyword.function"] = {
    italic = true,
  },
  -- return, yield keywords
  ["@keyword.return"] = {
    bold = true,
    italic = true,
  },
  -- function names
  ["@function"] = {
    italic = false,
  },
  -- symbolic
  ["@operator"] = {
    bold = true,
  },
  -- logical keywords 
  ["@keyword.operator"] = {
    italic = true,
  },
  -- function parameters
  ["@parameter"] = {
    italic = true,},
  -- Italic end here
  ["@comment"] = { italic = true },
  Search = { fg = "black", bg = "blue" },
  IncSearch = { fg = "black", bg = "red" },
  CurSearch = { fg = "black", bg = "blue" },
  Substitute = { fg = "black", bg = "green" },
  NvDashAscii = { bg = "NONE", fg = "blue" },
  NvDashButtons = { bg = "NONE" },
  FoldColumn = { bg = "NONE" },
  LspReferenceRead = { link = "Underlined" },
  LspReferenceText = { link = "Underlined" },
  LspReferenceWrite = { link = "Underlined" },
  TblineFill = { link = "Normal" },
  NvimTreeRootFolder = { link = "NvimTreeFolderName" },
}

---@type HLTable
M.add = {
  WinBar = { link = "Normal" },
  WinBarNC = { link = "Normal" },
  DiffviewDiffAdd = { fg = "black", bg = "green" },
  DiffviewDiffChange = { fg = "black", bg = "green" },
  DiffviewDiffDelete = { fg = "black", bg = "red" },
  DiffviewDiffAddAsDelete = { fg = "black", bg = "red" },
  LspInlayHint = { link = "Comment" },
  -- Avante sidebar
  AvanteSidebarNormal = { link = "Normal" },
  AvanteSidebarWinSeparator = { link = "WinSeparator" },
  AvanteSidebarWinHorizontalSeparator = { fg = "purple", bg = "NONE" },
}

return M
