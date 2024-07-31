return{
  "lewis6991/satellite.nvim",
  lazy = false,
  config = function()
    require("satellite").setup(
    {
      width = 5,
    }
    )
  end,
}
