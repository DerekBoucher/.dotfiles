return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })
        end,
    },
    {
        "folke/neodev.nvim",
        config = function()
            require("neodev").setup({})
        end,
    },
    {
        "rshkarin/mason-nvim-lint",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-lint",
        },
        config = function()
            require("mason-nvim-lint").setup({
                ensure_installed = { "stylua", "prettier", "codelldb" },
            })
        end,
    },
    {
        "elentok/format-on-save.nvim",
        config = function()
            local formatters = require("format-on-save.formatters")
            require("format-on-save").setup({
                formatter_by_ft = {
                    lua = formatters.lsp,
                    typescript = formatters.prettier,
                    javascript = formatters.lsp,
                    go = formatters.lsp,
                    rust = formatters.lsp,
                    json = formatters.lsp,
                },
            })
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    -- formatters
                    null_ls.builtins.formatting.stylua,
                    null_ls.builtins.formatting.prettier,

                    -- linters
                    null_ls.builtins.diagnostics.eslint_d,
                },
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "rust_analyzer", "tsserver", "eslint", "gopls" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "folke/neodev.nvim",
        },
        opts = {
            autoformat = true,
        },
        config = function()
            local lspconfig = require("lspconfig")

            -- Autocompletions
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {},
                        completions = {
                            callSnippet = "Replace",
                        },
                    },
                },
            })

            lspconfig.gopls.setup({
                capabilities = capabilities,
            })

            --  Handled by rust-tools
            --	lspconfig.rust_analyzer.setup({
            --		capabilities = capabilities,
            --	})

            lspconfig.tsserver.setup({
                capabilities = capabilities,
            })
        end,
    },
}
