return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    animate = { enabled = false },
    lazygit = { enabled = true },
    image = { enabled = true },
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = false },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = false },
    words = { enabled = false },
  },
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
