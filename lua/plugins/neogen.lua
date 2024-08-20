--@type NvPluginSpec
return {
    "danymat/neogen",
    opts = true,
    keys = {
        {
            "<leader>a",
            function()
                require("neogen").generate()
            end,
            desc = "Add Docstring",
    },
    config = true,
}
}
