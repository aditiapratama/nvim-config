require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")
-- map("i", "jj", "<ESC>")
-- map("n", "<leader>sv", ":source $MYVIMRC<CR>", { noremap = true, silent = true })
-- Move
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
  require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })
