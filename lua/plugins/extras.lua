---@type NvPluginSpec
return {
  {
    "KronsyC/nvim-license",
    opts = function()
      return {
        name = "Aditia A. Pratama",
        -- Optional
        -- year = "2024",
      }
    end,

    cmd = {
      "License",
      "LicenseHeader",
      "AutoLicense",
    },
    dependencies = {
      { "numToStr/Comment.nvim" },
    },
  },
  {
    "farmergreg/vim-lastplace",
    event = { "bufReadPost", "bufNewFile" },
  },
}
