return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            options = {
                theme = "nightfly",
                icons_enabled = true,
            },
            sections = {
                lualine_b = { { "filename", path = 1 } },
            },
        })
    end,
}
