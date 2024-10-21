local function get_venv(variable)
  local venv = os.getenv(variable)
  if venv ~= nil and string.find(venv, "/") then
    local orig_venv = venv
    for w in orig_venv:gmatch "([^/]+)" do
      venv = w
    end
    venv = string.format("%s", venv)
  end
  return venv
end

---@type NvPluginSpec
--- NOTE: Incline for naming if modified
return {
  "b0o/incline.nvim",
  event = "BufReadPre",
  priority = 1200,
  config = function()
    require("incline").setup {
      window = { margin = { vertical = 0, horizontal = 1 } },
      hide = { cursorline = true },
      render = function(props)
        local colors = dofile(vim.g.base46_cache .. "colors")
        -- Get filename and parent directory
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        local parent_dir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":p:h:t")

        -- Mark modified files
        if vim.bo[props.buf].modified then
          filename = "[+]" .. filename
        end

        -- if vim.bo.filetype ~= "python" then
        --   return " "
        -- end

        local venv = get_venv "CONDA_DEFAULT_ENV" or get_venv "VIRTUAL_ENV" or " "

        -- Get icon and color for filename
        local file_icon, file_color = require("nvim-web-devicons").get_icon_color(filename)
        -- Use a custom folder icon if devicons can't provide one
        local folder_icon = " " -- Default folder icon (nerd font)
        local folder_color = colors.green --"#6d8086" -- Default folder color

        local sep = ""
        local render_venv = function()
          if venv == " " then
            return " "
          else
            return "   " .. venv
          end
        end

        local bgcol = props.focused and colors.one_bg or colors.one_bg3
        -- local bgcol = props.focused and "#41798f" or "#44406e"

        return {
          -- { "" .. sep .. " " },
          { " " },
          { file_icon, guifg = file_color },
          { " " },
          { " " },
          { filename },
          -- { " " },
          { " " },
          { " " },
          { folder_icon, guifg = folder_color },
          { " " },
          { parent_dir },
          { render_venv() },
          -- { "" .. sep .. " " },
          guibg = bgcol,
        }
      end,
    }
  end,
}
