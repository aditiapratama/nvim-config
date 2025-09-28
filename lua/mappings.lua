require "nvchad.mappings"
local cwd = vim.fn.stdpath "config" .. "/"
local config_dir = { cwd }
local utils = require "core.utils"

-- add yours here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Toggle Wrap
vim.keymap.set("n", "<leader>ow", function()
  vim.wo.wrap = not vim.wo.wrap
  if vim.wo.wrap then
    vim.notify("Toggled On", vim.log.levels.INFO, { title = "Line Wrap" })
  else
    vim.notify("Toggled Off", vim.log.levels.INFO, { title = "Line Wrap" })
  end
end, { desc = "Options | Toggle Wrap", silent = true })

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")
-- map("i", "jj", "<ESC>")
-- map("n", "<leader>sv", ":source $MYVIMRC<CR>", { noremap = true, silent = true })
-- Move
map({ "n", "t" }, "<A-i>", function()
  require("floaterm").toggle()
end)
-- Normal-mode commands
map("n", "<A-j>", ":MoveLine(1)<CR>", opts)
map("n", "<A-k>", ":MoveLine(-1)<CR>", opts)
-- map('n', '<A-h>', ':MoveHChar(-1)<CR>', opts)
-- map('n', '<A-l>', ':MoveHChar(1)<CR>', opts)
map("n", "<leader>wf", ":MoveWord(1)<CR>", opts)
map("n", "<leader>wb", ":MoveWord(-1)<CR>", opts)

-- Visual-mode commands
map("v", "<A-j>", ":MoveBlock(1)<CR>", opts)
map("v", "<A-k>", ":MoveBlock(-1)<CR>", opts)
map("v", "<A-h>", ":MoveHBlock(-1)<CR>", opts)
map("v", "<A-l>", ":MoveHBlock(1)<CR>", opts)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- Shift + arrow left and right
map("i", "<S-left>", "<ESC>vB", opts)
map("i", "<S-right>", "<ESC>vE", opts)
map("v", "<S-left>", "B", opts)
map("v", "<S-right>", "E", opts)

-- Project
map("n", "<leader>fp", "<CMD>:ProjectMgr<CR>", { desc = "Open Projects" })
map("n", "[c", function()
  require("treesitter-context").go_to_context(vim.v.count)
end, { silent = true })

-- Save with Ctrl+S and go to normal mode
map("i", "<C-s>", "<Esc>:w<cr>", opts)

-- Quit
map("n", "<leader>q", "<cmd>qa!<cr>", { desc = "General | Quit", silent = true })

-- Close Buffer
map("n", "<leader>c", "<cmd>Bdelete!<cr>", { desc = "General | Close Buffer", silent = true })

-- Remove All Text
map("n", "<leader>R", "<cmd>%d+<cr>", { desc = "General | Remove All Text", silent = true })

-- Yank all Text
map("n", "<leader>y", "<cmd>%y+<cr>", { desc = "General | Yank All Text", silent = true })

-- Better Down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { desc = "General | Better Down", expr = true, silent = true })

-- Better Up
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { desc = "General | Better Up", expr = true, silent = true })

-- Better Down (Visual Mode)
map("v", "j", "v:count == 0 ? 'gj' : 'j'", { desc = "General | Better Down", expr = true, silent = true })

-- Better Up (Visual Mode)
map("v", "k", "v:count == 0 ? 'gk' : 'k'", { desc = "General | Better Up", expr = true, silent = true })

-- Clear highlights manually with Esc
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR><Esc>", { desc = "General | Clear search highlight with Esc" })

-- Indent backward
map("n", "<", "<<", { desc = "General | Indent backward", silent = true })

-- Indent forward
map("n", ">", ">>", { desc = "General | Indent forward", silent = true })

-- Indent backward (Visual Mode)
map("v", "<", "<gv", { desc = "General | Indent backward", silent = true })

-- Indent forward (Visual Mode)
map("v", ">", ">gv", { desc = "General | Indent forward", silent = true })

-- Better Paste (Visual Mode)
map("v", "p", '"_dP', { desc = "General | Better Paste", silent = true })

-- Messages
map("n", "<leader>nm", "<cmd>messages<cr>", { desc = "Neovim | Messages", silent = true })

-- Health
map("n", "<leader>nh", "<cmd>checkhealth<cr>", { desc = "Neovim | Health", silent = true })

-- Version
map("n", "<leader>nv", function()
  local version = vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
  return vim.notify(version, vim.log.levels.INFO, { title = "Neovim Version" })
end, { desc = "Neovim | Version", silent = true })

-- Clean
map("n", "<leader>pc", "<cmd>Lazy clean<cr>", { desc = "Lazy | Clean", silent = true })

-- Check
map("n", "<leader>pC", "<cmd>Lazy check<cr>", { desc = "Lazy | Check", silent = true })

-- Debug
map("n", "<leader>pd", "<cmd>Lazy debug<cr>", { desc = "Lazy | Debug", silent = true })

-- Install
map("n", "<leader>pi", "<cmd>Lazy install<cr>", { desc = "Lazy | Install", silent = true })

-- Sync
map("n", "<leader>ps", "<cmd>Lazy sync<cr>", { desc = "Lazy | Sync", silent = true })

-- Log
map("n", "<leader>pl", "<cmd>Lazy log<cr>", { desc = "Lazy | Log", silent = true })

-- Home
map("n", "<leader>ph", "<cmd>Lazy home<cr>", { desc = "Lazy | Home", silent = true })

-- Help
map("n", "<leader>pH", "<cmd>Lazy help<cr>", { desc = "Lazy | Help", silent = true })

-- Profile
map("n", "<leader>pp", "<cmd>Lazy profile<cr>", { desc = "Lazy | Profile", silent = true })

-- Update
map("n", "<leader>pu", "<cmd>Lazy update<cr>", { desc = "Lazy | Update", silent = true })

-- treewalker plugins
-- movement
-- map({ "n", "v" }, "<C-k>", "<cmd>Treewalker Up<cr>", { silent = true })
-- map({ "n", "v" }, "<C-j>", "<cmd>Treewalker Down<cr>", { silent = true })
-- map({ "n", "v" }, "<C-h>", "<cmd>Treewalker Left<cr>", { silent = true })
-- map({ "n", "v" }, "<C-l>", "<cmd>Treewalker Right<cr>", { silent = true })
map({ "n", "v" }, "<C-Up>", "<cmd>Treewalker Up<cr>", { silent = true })
map({ "n", "v" }, "<C-Down>", "<cmd>Treewalker Down<cr>", { silent = true })
map({ "n", "v" }, "<C-Left>", "<cmd>Treewalker Left<cr>", { silent = true })
map({ "n", "v" }, "<C-Right>", "<cmd>Treewalker Right<cr>", { silent = true })

-- swapping (using alternative key combinations that work better across terminals)
map("n", "<leader>wk", "<cmd>Treewalker SwapUp<cr>", { desc = "Treewalker | Swap Up", silent = true })
map("n", "<leader>wj", "<cmd>Treewalker SwapDown<cr>", { desc = "Treewalker | Swap Down", silent = true })
map("n", "<leader>wh", "<cmd>Treewalker SwapLeft<cr>", { desc = "Treewalker | Swap Left", silent = true })
map("n", "<leader>wl", "<cmd>Treewalker SwapRight<cr>", { desc = "Treewalker | Swap Right", silent = true })
