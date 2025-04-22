local dap = require "dap"
local path = ""

if vim.fn.has "win32" == 1 then
  path = vim.fn.stdpath "data" .. "/mason/packages/debugpy/venv/Scripts/python"
else
  path = vim.fn.stdpath "data" .. "/mason/packages/debugpy/venv/bin/python"
end

require("dap-python").setup(path)
-- Define the Python adapter
-- dap.adapters.python = function(cb, config)
--   if config.request == "attach" then
--     ---@diagnostic disable-next-line: undefined-field
--     local port = (config.connect or config).port
--     ---@diagnostic disable-next-line: undefined-field
--     local host = (config.connect or config).host or "127.0.0.1"
--     cb {
--       type = "server",
--       port = assert(port, "`connect.port` is required for a python `attach` configuration"),
--       host = host,
--       options = {
--         source_filetype = "python",
--       },
--     }
--   else
--     cb {
--       type = "executable",
--       command = path,
--       args = { "-m", "debugpy.adapter" },
--       options = {
--         source_filetype = "python",
--       },
--     }
--   end
-- end

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = "launch",
    name = "Launch file",

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}", -- This configuration will launch the current file if used.
    pythonPath = function()
      local detected_path = nil

      -- Check for local virtual environments first
      local cwd = vim.fn.getcwd()
      for _, venv in ipairs { "/venv/bin/python", "/.venv/bin/python" } do
        if vim.fn.executable(cwd .. venv) == 1 then
          detected_path = cwd .. venv
          break
        end
      end

      -- Check for active virtual environment from VIRTUAL_ENV
      if not detected_path then
        local virtual_env = os.getenv "VIRTUAL_ENV"
        if virtual_env and vim.fn.executable(virtual_env .. "/bin/python") == 1 then
          detected_path = virtual_env .. "/bin/python"
        end
      end

      -- Check for pyenv
      if not detected_path then
        local pyenv_root = os.getenv "PYENV_ROOT" or os.getenv "HOME" .. "/.pyenv"

        -- Try to get pyenv version directly
        local handle = io.popen "pyenv version-name 2>/dev/null"
        if handle then
          local version = handle:read("*a"):gsub("%s+$", "")
          handle:close()

          if version ~= "" and version ~= "system" then
            local python_path = pyenv_root .. "/versions/" .. version .. "/bin/python"
            if vim.fn.executable(python_path) == 1 then
              detected_path = python_path
            end
          end
        end
      end

      -- Fallback to the debugpy python
      if not detected_path then
        detected_path = path
      end

      -- Notify the user about the detected Python path
      vim.notify("DAP using Python: " .. detected_path, vim.log.levels.INFO)

      return detected_path
    end,
  },
}
