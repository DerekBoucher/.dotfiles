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
        lazy = false,
        config = function()
            require("mason-nvim-lint").setup({
                ensure_installed = { "stylua", "prettier", "codelldb", "buf", "eslint_d", "fixjson" },
                automatic_installation = false,
            })
        end,
    },
    {
        "elentok/format-on-save.nvim",
        config = function()
            local formatters = require("format-on-save.formatters")
            require("format-on-save").setup({
                formatter_by_ft = {
                    c = formatters.lsp,
                    lua = formatters.lsp,
                    typescript = formatters.lsp,
                    javascript = formatters.lsp,
                    typescriptreact = formatters.lsp,
                    javascriptreact = formatters.lsp,
                    go = formatters.lsp,
                    rust = formatters.lsp,
                    json = formatters.lsp,
                    proto = formatters.lsp,
                    yaml = formatters.lsp,
                    html = formatters.lsp,
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
                },
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer",
                    "ts_ls",
                    "eslint",
                    "gopls",
                    "clangd",
                    "docker_compose_language_service",
                    "dockerls",
                    "bufls",
                    "jsonls",
                    "html",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "folke/neodev.nvim",
            "ray-x/lsp_signature.nvim",
        },
        opts = {
            autoformat = true,
            inlay_hints = { enabled = true },
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

            lspconfig.jsonls.setup({
                capabilities = capabilities,
            })

            lspconfig.dockerls.setup({
                capabilities = capabilities,
            })

            lspconfig.clangd.setup({
                capabilities = capabilities,
            })

            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
            })

            lspconfig.gopls.setup({
                capabilities = capabilities,
                settings = {
                    gopls = {
                        buildFlags = { "-tags=wireinject" },
                        analyses = {
                            fillstruct = true,
                        },
                    },
                },
            })

            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })

            lspconfig.bufls.setup({
                capabilities = capabilities,
            })

            lspconfig.dockerls.setup({
                capabilities = capabilities,
            })

            lspconfig.docker_compose_language_service.setup({
                capabilities = capabilities,
            })

            lspconfig.html.setup({
                capabilities = capabilities,
            })

            require("lsp_signature").setup({})
        end,
    },
}
