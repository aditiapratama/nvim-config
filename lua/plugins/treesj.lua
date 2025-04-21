--@type NvPluginSpec
--NOTE: Split lines to avoid the max line lengths
return {
  "Wansmer/treesj",
  enabled = false,
  event = { "BufReadPost", "BufNewFile" },
  keys = { "<space>m", "<space>j", "<space>s" },
  dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
  config = function()
    require("treesj").setup {--[[ your config ]]
    }
  end,
}
