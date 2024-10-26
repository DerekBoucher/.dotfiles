local colors = {
    black = "#080808",
    yellow = "#ffff00",
    white = "#ffffff",
}

local black_yellow = {
    normal = {
        a = { fg = colors.black, bg = colors.yellow },
        b = { fg = colors.yellow, bg = colors.black },
        c = { fg = colors.white },
    },

    insert = { a = { fg = colors.black, bg = colors.yellow } },
    visual = { a = { fg = colors.black, bg = colors.yellow } },
    replace = { a = { fg = colors.black, bg = colors.yellow } },

    inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white },
    },
}

return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            options = {
                theme = black_yellow,
                icons_enabled = true,
                show_filename_only = false,
            },
            sections = {
                lualine_b = { "branch", "location" },
                lualine_c = { { "filename", path = 1 } },
            },
        })
    end,
}
