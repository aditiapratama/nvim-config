---@type NvPluginSpec
-- NOTE: Notification
return {
  "rcarriga/nvim-notify",
  -- lazy = false,
  event = "VeryLazy",
  opts = {
    level = 2,
    minimum_width = 50,
    render = "default",
    stages = "fade",
    timeout = 3000,
    top_down = false,
    background_colour = "#000000",
  },
  config = function(_, opts)
    require("notify").setup(opts)
    vim.notify = require "notify"
    local messages = require "configs.messages"
    math.randomseed(os.time())
    local randomMessage = messages[math.random(#messages)]
    if vim.g.startup_message then
      vim.notify(randomMessage, vim.log.levels.INFO, { title = "Just For Fun:" })
    end
  end,
}
-- dofile(vim.g.base46_cache .. "notify")
