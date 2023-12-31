return { 
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local ts_config = require("nvim-treesitter.configs")
        ts_config.setup({
            ensure_installed = { "lua", "rust", "html", "typescript", "javascript", "go", "vim" },
            highlight = { enable = true },
            indent = { enable = true }
        })
    end
}

