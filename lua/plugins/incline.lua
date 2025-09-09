local function get_venv(variable)
  local venv = os.getenv(variable)
  if venv ~= nil then
    -- Extract just the directory name from the path
    local path_separator = package.config:sub(1, 1) -- Gets the path separator for the current OS
    local last_separator = venv:match(".*" .. path_separator .. "()") or 1
    venv = venv:sub(last_separator)
  end
  return venv
end
-- Function to get git repository information
local function get_git_info()
  -- Get the git directory
  local git_dir = vim.fn.system("git rev-parse --git-dir 2>/dev/null"):gsub("\n", "")
  if git_dir == "" or git_dir:match "fatal" then
    return { is_git = false }
  end

  -- Get the repository name (last part of the remote URL)
  local remote_url = vim.fn.system("git config --get remote.origin.url 2>/dev/null"):gsub("\n", "")
  if remote_url == "" then
    return { is_git = true, provider = "git", repo_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t") }
  end

  local repo_name = ""
  local provider = "git"

  -- Extract repo name and identify provider
  if remote_url:match "github%.com" then
    provider = "github"
    repo_name = remote_url:match "github%.com[:/](.+)%.git$" or remote_url:match "github%.com[:/](.+)$"
  elseif remote_url:match "gitlab%.com" then
    provider = "gitlab"
    repo_name = remote_url:match "gitlab%.com[:/](.+)%.git$" or remote_url:match "gitlab%.com[:/](.+)$"
  elseif remote_url:match "bitbucket%.org" then
    provider = "bitbucket"
    repo_name = remote_url:match "bitbucket%.org[:/](.+)%.git$" or remote_url:match "bitbucket%.org[:/](.+)$"
  else
    -- Extract repo name from generic git URL
    repo_name = remote_url:match "[:/]([^/]+/[^/]+)%.git$" or remote_url:match "[:/]([^/]+/[^/]+)$"
    if not repo_name then
      repo_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    end
  end

  return { is_git = true, provider = provider, repo_name = repo_name }
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
        -- Only render for the focused buffer
        if not props.focused then
          return ""
        end
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

        -- Get git repository information
        local git_info = get_git_info()

        -- Get icon and color for filename
        local file_icon, file_color = require("nvim-web-devicons").get_icon_color(filename)
        -- Use a custom folder icon if devicons can't provide one
        local folder_icon = " " -- Default folder icon (nerd font)
        local folder_color = colors.green --"#6d8086" -- Default folder color

        -- Set git provider icon
        local git_icon = "   " -- Default git icon
        local git_color = colors.orange

        if git_info.is_git then
          if git_info.provider == "github" then
            git_icon = "  " -- GitHub icon
            git_color = colors.blue
          elseif git_info.provider == "gitlab" then
            git_icon = " 󰮠  " -- GitLab icon
            git_color = colors.orange
          elseif git_info.provider == "bitbucket" then
            git_icon = "  " -- Bitbucket icon
            git_color = colors.cyan
          end
        end

        local sep = ""
        local render_venv = function()
          if venv == " " then
            return " "
          else
            return "  " .. venv
          end
        end

        local render_git_info = function()
          if not git_info.is_git then
            return ""
          else
            return "" .. git_icon .. "" .. git_info.repo_name
          end
        end

        local bgcol = props.focused and colors.one_bg or colors.one_bg3
        -- local bgcol = props.focused and "#41798f" or "#44406e"

        return {
          -- { "" .. sep .. " " },
          { " " },
          { file_icon, guifg = file_color },
          { " " },
          -- { " " },
          { filename },
          -- { " " },
          { " " },
          { " " },
          { folder_icon, guifg = folder_color },
          -- { " " },
          { parent_dir },
          { render_venv() },
          { render_git_info(), guifg = git_color },
          -- { "" .. sep .. " " },
          guibg = bgcol,
        }
      end,
    }
  end,
}
