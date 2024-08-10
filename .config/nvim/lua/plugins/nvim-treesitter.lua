return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local ts_config = require("nvim-treesitter.configs")
        ts_config.setup({
            modules = {},
            sync_install = false,
            ignore_install = {},
            auto_install = true,
            ensure_installed = {
                "c",
                "lua",
                "rust",
                "html",
                "typescript",
                "javascript",
                "go",
                "vim",
                "vimdoc",
                "http",
                "json",
            },
            highlight = {
                enable = true,
                disable = { "txt" },
            },
            indent = { enable = true },
        })
    end,
}
