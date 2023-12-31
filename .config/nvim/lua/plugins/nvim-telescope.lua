return {
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            local telescope = require("telescope")
            telescope.setup({
                extension = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                            --- opts
                        }
                    }
                }
            })
            telescope.load_extension("ui-select")
        end
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")

            vim.keymap.set('n', '<C-p>', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        end
    },
    {
        "willthbill/opener.nvim",
        config = function()
            local telescope = require("telescope")
            telescope.setup({
                extensions = {
                    opener = {
                        hidden = true,
                        respect_gitignore = true
                    }
                }
            })
            telescope.load_extension("opener")

            local opener = telescope.extensions.opener
            vim.keymap.set('n', '<C-r>', opener.opener, {})
        end
    }
}
