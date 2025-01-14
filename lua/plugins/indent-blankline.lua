local highlight_bg = {
  "CursorColumn",
  "Whitespace",
}

---@type NvPluginSpec
-- NOTE: Show Indentlines
return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    -- Other blankline configuration here
    opts.scope.enabled = false
    require("indent-rainbowline").make_opts(opts, {
      color_transparency = 0.18,
      -- NOTE: dracula colors
      -- colors = { 0x8be9fd, 0x50fa7b, 0xffb86c, 0xff79c6, 0xbd93f9, 0xff5555, 0xf1fa8c },
      -- NOTE: catppuccin colors
      -- colors = { 0x94e2d5, 0xa6e3a1, 0xf38ba8, 0xfab387, 0x89b4fa, 0xb4befe, 0xf9e2af }
      -- NOTE: onedark colors
      -- colors = { 0x61afef, 0x98c379, 0xe06c75, 0xe5c07b, 0xc678dd, 0xd19a66, 0x56b6c2 },
      -- NOTE: tokyonight colors
      colors = { 0x7aa2f7, 0x9ece6a, 0xf7768e, 0xe0af68, 0xbb9af7, 0xff9e64, 0x7dcfff },
    })
    return opts
  end,
  dependencies = {
    "TheGLander/indent-rainbowline.nvim",
  },
}
