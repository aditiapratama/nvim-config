---@type NvPluginSpec
-- NOTE: Notification
return {
  "rcarriga/nvim-notify",
  -- lazy = false,
  event = { "bufReadPost", "bufNewFile" },
  opts = {
    level = 2,
    -- minimum_width = 50,
    max_width = 50,
    render = "wrapped-compact",
    stages = "fade_in_slide_out",
    timeout = 3000,
    top_down = true,
  },
  config = function(_, opts)
    local base46 = require("nvconfig").base46

    if base46.transparency then
      opts.background_colour = "#000000"
    end

    require("notify").setup(opts)

    vim.notify = require "notify"
    local messages = require "configs.messages"
    math.randomseed(os.time())
    local randomMessage = messages[math.random(#messages)]
    if vim.g.startup_message then
      vim.notify(randomMessage, vim.log.levels.INFO, { title = "Wise Words:" })
    end
  end,
}
-- dofile(vim.g.base46_cache .. "notify")
