local options = {
  profiles = { --                 Profile[]?       list of blender profiles
    --
    {
      name = "Blender 4.1", --        string           profile name, must be unique
      cmd = "/opt/blender/4.1.1/blender", --         string|string[]  command to run Blender
      -- use_launcher = true --   boolean?         whether to run the launcher.py script when starting Blender
      -- extra_args = {} --       string[]?        extra arguments to pass to Blender
      -- enable_dap = nil --      boolean?         whether to enable DAP for this profile (if nil, the global setting is used)
      -- watch = nil --           boolean?         whether to watch the add-on directory for changes (if nil, the global setting is used)
    },
    {
      name = "Blender 3.6",
      cmd = "/opt/blender/3.0.0/blender",
    },
  },
  dap = { --                      DapConfig?       DAP configuration
    enabled = true, --            boolean?         whether to enable DAP (can be overridden per profile)
  },
  notify = { --                   NotifyConfig?    notification configuration
    enabled = true, --            boolean?         whether to enable notifications
    verbosity = "INFO", --        'TRACE'|'DEBUG'|'INFO'|'WARN'|'ERROR'|'OFF'|vim.log.level?  log level for notifications
  },
  watch = { --                    WatchConfig?     file watcher configuration
    enabled = true, --            boolean?         whether to watch the add-on directory for changes (can be overridden per profile)
  },
}

require("blender").setup(options)
