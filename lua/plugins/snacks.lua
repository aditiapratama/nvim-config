return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  config = function()
    local Snacks = require "snacks"
    -- local maputil = require "user.util.map"
    -- local map = maputil.map

    Snacks.setup {
      ---@type snacks.Config
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = {
        enabled = true,
        notify = true,
        size = 1.5 * 1024 * 1024, -- 1.5MB
        -- Enable or disable features when big file detected
        ---@param ctx {buf: number, ft:string}
        setup = function(ctx)
          ---@diagnostic disable-next-line: missing-fields
          Snacks.util.wo(0, {
            foldmethod = "manual",
            statuscolumn = "",
            conceallevel = 0,
          })
          vim.schedule(function()
            vim.bo[ctx.buf].syntax = ctx.ft
          end)
        end,
      },
      quickfile = { enabled = true },
      statuscolumn = { enabled = false },
      words = { enabled = false },
      indent = {
        enabled = true,
        indent = { enabled = true },
        animate = { enabled = false },
        scope = { enabled = true, only_current = true },
      },
      animate = { enabled = false },
      lazygit = { enabled = true },
      image = { enabled = true },
      dashboard = { enabled = false },
      explorer = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = false },
      scope = {
        enabled = true,
        keys = {
          ---@type table<string, snacks.scope.TextObject|{desc?:string}>
          textobject = {
            ii = {
              min_size = 2,
              edge = false,
              cursor = true,
              desc = "inside scope",
            },
            ai = {
              cursor = true,
              edge = true,
              min_size = 2,
              desc = "around scope",
            },
          },
          ---@type table<string, snacks.scope.Jump|{desc?:string}>
          jump = {
            ["[s"] = {
              min_size = 2,
              bottom = false,
              cursor = true,
              edge = true,
              desc = "Scope: start",
            },
            ["]s"] = {
              min_size = 2,
              bottom = true,
              cursor = true,
              edge = true,
              desc = "Scope: end",
            },
          },
        },
      },
      scroll = { enabled = false },
    }
  end,
  keys = {

    -- Top Pickers & Explorer
    {
      "<leader><space>",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart Find Files",
    },
    {
      "<leader>,",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>:",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>nn",
      function()
        Snacks.picker.notifications()
      end,
      desc = "Notification History",
    },
    {
      "<leader>fe",
      function()
        Snacks.explorer()
      end,
      desc = "File Explorer",
    },
    -- find
    -- {
    --   "<leader>fc",
    --   function()
    --     Snacks.picker.files { cwd = vim.fn.stdpath "config" }
    --   end,
    --   desc = "Find Config File",
    -- },
    {
      "<leader>fc",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>fg",
      function()
        Snacks.picker.git_files()
      end,
      desc = "Find Git Files",
    },
    {
      "<leader>fp",
      function()
        Snacks.picker.projects()
      end,
      desc = "Projects",
    },
    {
      "<leader>fr",
      function()
        Snacks.picker.recent()
      end,
      desc = "Recent",
    },
    -- lazygit
    {
      "<leader>lg",
      function()
        Snacks.lazygit.open()
      end,
      desc = "lazygit",
    },
    -- your keymaps come here
    -- or leave it empty to use the default settings
    -- refer to the keymaps section below
  },
}
