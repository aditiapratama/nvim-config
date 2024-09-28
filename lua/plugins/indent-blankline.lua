local highlight_bg = {
  "CursorColumn",
  "Whitespace",
}

---@type NvPluginSpec
-- NOTE: Show Indentlines
return {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPost",
  opts = {
    indent = {
      highlight = highlight_bg,
      char = "▏",
    },
    whitespace = {
      highlight = highlight_bg,
      remove_blankline_trail = false,
    },
    scope = {
      show_start = false,
    },
  },
  config = function(_, opts)
    require("ibl").setup(opts)
  end,
}
