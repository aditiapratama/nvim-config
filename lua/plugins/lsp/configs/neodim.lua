return {
  "zbirenbaum/neodim",
  event = "LspAttach",
  enabled = false,
  config = function()
    require("neodim").setup {
      alpha = 0.50,
      blend_color = "#000000",
      hide = {
        underline = true,
        virtual_text = true,
        signs = true,
      },
      regex = {
        "[uU]nused",
        "[nN]ever [rR]ead",
        "[nN]ot [rR]ead",
      },
      priority = 128,
      disable = {},
    }
  end,
}
