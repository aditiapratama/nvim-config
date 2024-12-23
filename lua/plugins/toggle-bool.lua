---@type NvPluginSpec
--- NOTE:: Bool Toggle plugin
return {
  "gerazov/toggle-bool.nvim",
  event = "User FilePost",
  opts = {
    mapping = "<leader>tt",
    additional_toggles = {
      Yes = "No",
      On = "Off",
      ["0"] = "1",
      Enable = "Disable",
      Enabled = "Disabled",
      First = "Last",
      Before = "After",
      Persistent = "Ephemeral",
      Internal = "External",
      Ingress = "Egress",
      Allow = "Deny",
      All = "None",
    },
  },
  config = function(_, opts)
    require("toggle-bool").setup(opts)
  end,
}
