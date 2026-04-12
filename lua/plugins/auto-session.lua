---@type NvPluginSpec
-- NOTE: Sessions
return {
  "rmagatti/auto-session",
  -- enabled = false,
  lazy = false,
  dependencies = {
    "nvim-telescope/telescope.nvim", -- Only needed if you want to use sesssion lens
  },
  init = function()
    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

    vim.keymap.set("n", "<leader>st", "<cmd>SessionToggleAutoSave<cr>", { desc = "Session | Toggle", silent = true })
    vim.keymap.set("n", "<leader>sS", "<cmd>SessionSearch<cr>", { desc = "Session | Search", silent = true })
    vim.keymap.set("n", "<leader>sd", "<cmd>SessionDelete<cr>", { desc = "Session | Delete", silent = true })
    vim.keymap.set("n", "<leader>sr", "<cmd>SessionRestore<cr>", { desc = "Session | Restore", silent = true })
    vim.keymap.set("n", "<leader>ss", "<cmd>SessionSave<cr>", { desc = "Session | Save", silent = true })

    vim.api.nvim_create_autocmd({ "BufEnter" }, {
      pattern = "NvimTree*",
      callback = function()
        local api = require "nvim-tree.api"
        local view = require "nvim-tree.view"
        if not view.is_visible() then
          api.tree.open()
        end
      end,
    })
  end,
  opts = {
    enabled = true, -- Enables/disables the plugin's auto save and restore features
    auto_save = true, -- Enables/disables auto saving
    auto_restore = true, --Enables/disables auto restoring
    bypass_save_filetypes = { "NvimTree", "nvdash" },
    git_use_branch_name = true, -- Use the git branch to differentiate the session name
    auto_delete_empty_sessions = true, -- Automatically delete empty sessions
    session_lens = {
      load_on_setup = true,
      picker_opts = {
        border = true,
      },
      previewer = "summary",
    },
    suppressed_dirs = { "/", "~/", "~/Downloads" },
  },
}
