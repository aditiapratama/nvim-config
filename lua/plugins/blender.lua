---@type NvPluginSpec
--- Blender
return {
  "b0o/blender.nvim",
  event = { "bufReadPost", "bufNewFile" },
  config = function()
    require("blender").setup {
      profiles = { --                 Profile[]?       list of blender profiles
        --
        -- {
        -- name = "Blender 4.1", --        string           profile name, must be unique
        -- cmd = "/opt/blender/4.1.1/blender", --         string|string[]  command to run Blender
        -- use_launcher = true --   boolean?         whether to run the launcher.py script when starting Blender
        -- extra_args = {} --       string[]?        extra arguments to pass to Blender
        -- enable_dap = nil --      boolean?         whether to enable DAP for this profile (if nil, the global setting is used)
        -- watch = nil --           boolean?         whether to watch the add-on directory for changes (if nil, the global setting is used)
        -- },
        {
          name = "DeepPaint 5.0",
          cmd = "/opt/blender/5.0/blender",
          env = { ["BLENDER_SYSTEM_EXTENSIONS"] = "/home/aditia/Documents/blender5/" },
        },
        { name = "Blender 4.5", cmd = "/opt/blender/4.2/blender" },
        { name = "Blender 4.4", cmd = "/opt/blender/4.4/blender" },
        { name = "Blender 4.3", cmd = "/opt/blender/4.3/blender" },
        { name = "Blender 4.1", cmd = "/opt/blender/4.1.1/blender" },
        { name = "Blender 3.6", cmd = "/opt/blender/3.6/blender" },
      },
      dap = { --                      DapConfig?       DAP configuration
        enabled = false, --            boolean?         whether to enable DAP (can be overridden per profile)
      },
      notify = { --                   NotifyConfig?    notification configuration
        enabled = true, --            boolean?         whether to enable notifications
        verbosity = "DEBUG", --        'TRACE'|'DEBUG'|'INFO'|'WARN'|'ERROR'|'OFF'|vim.log.level?  log level for notifications
      },
      watch = { --                    WatchConfig?     file watcher configuration
        enabled = true, --            boolean?         whether to watch the add-on directory for changes (can be overridden per profile)
      },
      -- panel = {
      --     height = 10;
      -- }
    }
  end,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "grapp-dev/nui-components.nvim",
    "mfussenegger/nvim-dap", -- Optional, for debugging with DAP
    "LiadOz/nvim-dap-repl-highlights", -- Optional, for syntax highlighting in the DAP REPL
  },
  keys = {
    {
      "<leader>1",
      function()
        require("blender.actions").toggle_ui()
      end,
      desc = "Toggle UI",
    },
    { "<leader>Bl", "<cmd>BlenderLaunch<cr>", desc = "launch Blender" },
    { "<leader>Bm", "<cmd>BlenderManage<cr>", desc = "Manage Blender" },
    { "<leader>Br", "<cmd>BlenderReload<cr>", desc = "Reload Blender" },
    { "<leader>Bu", "<cmd>BlenderUnwatch<cr>", desc = "Unwatch Blender" },
    { "<leader>Bw", "<cmd>BlenderWatch<cr>", desc = "Watch Blender" },
    {
      "q",
      function()
        require("blender.actions").close_ui()
      end,
      desc = "Close UI",
    },
    {
      "<leader>`",
      function()
        require("blender.actions").toggle_output_panel()
      end,
      desc = "Toggle Panel",
    },
  },
}
