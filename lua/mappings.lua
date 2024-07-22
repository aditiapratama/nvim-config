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

-- NVimTree h,j,k,l style navigation
local api = require "nvim-tree.api"

local function edit_or_open()
  local node = api.tree.get_node_under_cursor()

  if node.nodes ~= nil then
    -- expand or collapse folder
    api.node.open.edit()
  else
    -- open file
    api.node.open.edit()
    api.tree.focus()
    -- Close the tree if file was opened
    -- api.tree.close()
  end
end

-- open as vsplit on current node
local function vsplit_preview()
  local node = api.tree.get_node_under_cursor()

  if node.nodes ~= nil then
    -- expand or collapse folder
    api.node.open.edit()
  else
    -- open file as vsplit
    api.node.open.vertical()
  end

  -- Finally refocus on tree if it was lost
  api.tree.focus()
end
-- Collapse the current folder
local function collapse_node()
  local node = api.tree.get_node_under_cursor()
  if node.nodes ~= nil and node.open then
    api.node.open.edit()
  else
    api.node.navigate.parent()
    api.node.open.edit()
  end
end

map("n", "l", edit_or_open, { desc = "Edit or Open" })
map("n", "<right>", edit_or_open, { desc = "Edit or Open" })
map("n", "<S-l>", vsplit_preview, { desc = "Vsplit Preview" })
map("n", "<S-right>", vsplit_preview, { desc = "Vsplit Preview" })
map("n", "h", collapse_node, { desc = "Collapse" })
map("n", "<left>", collapse_node, { desc = "Collapse" })
map("n", "<S-h>", api.tree.collapse_all, { desc = "Collapse All" })
map("n", "<S-left>", api.tree.collapse_all, { desc = "Collapse All" })


-- Quit
map("n", "<leader>q", "<cmd>qa!<cr>", { desc = "General | Quit", silent = true })

-- Close Buffer
map("n", "<leader>c", "<cmd>Bdelete!<cr>", { desc = "General | Close Buffer", silent = true })
