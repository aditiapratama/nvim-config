local function on_attach(bufnr)
  local map = vim.keymap.set

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end
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
      -- api.tree.focus()
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
    -- api.tree.focus()
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
  api.config.mappings.default_on_attach(bufnr)

  map("n", "l", edit_or_open, opts "Edit or Open")
  map("n", "<right>", edit_or_open, opts "Edit or Open")
  map("n", "<S-l>", vsplit_preview, opts "Vsplit Preview")
  map("n", "<S-right>", vsplit_preview, opts "Vsplit Preview")
  map("n", "h", collapse_node, opts "Collapse")
  map("n", "<left>", collapse_node, opts "Collapse")
  map("n", "<S-h>", api.tree.collapse_all, opts "Collapse All")
  map("n", "<S-left>", api.tree.collapse_all, opts "Collapse All")
end
---@type NvPluginSpec
-- NvimTree
return {
  "nvim-tree/nvim-tree.lua",
  opts = {
    on_attach = on_attach,
    diagnostics = {
      enable = false,
      icons = {
        hint = "󰌵",
        info = "",
        warning = "",
        error = "",
      },
    },
    sync_root_with_cwd = true,
    update_focused_file = {
      enable = true,
      update_cwd = true,
      ignore_list = {},
    },
    git = {
      enable = true,
      ignore = true,
      show_on_dirs = true,
      show_on_open_dirs = true,
      timeout = 5000,
    },
    view = {
      cursorline = false,
      float = {
        enable = false,
        quit_on_focus_loss = true,
        open_win_config = {
          relative = "editor",
          border = "rounded",
          width = 30,
          height = 30,
          row = 1,
          col = 1,
        },
      },
    },
    renderer = {
      highlight_git = false,
      root_folder_label = false,
      -- root_folder_label = ":~:s?$?",
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },
        glyphs = {
          default = "󰈚",
          symlink = "",
          folder = {
            default = "",
            empty = "",
            empty_open = "",
            open = "",
            symlink = "",
            symlink_open = "",
            arrow_open = "",
            arrow_closed = "",
          },
          git = {
            unstaged = "",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "U",
            deleted = "",
            ignored = "◌",
          },
        },
      },
    },
    filters = {
      dotfiles = false,
      custom = { ".git" },
      exclude = {},
    },
  },
}
