return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
	},
	{
		"bluz71/vim-nightfly-colors",
		name = "nightfly",
		lazy = false,
		priority = 1000,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"tiagovla/tokyodark.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"Mofiqul/vscode.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
	},
	{
		"maxmx03/fluoromachine.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local fm = require("fluoromachine")

			fm.setup({
				glow = true,
				theme = "fluoromachine",
				transparent = false,
			})

			vim.cmd.colorscheme("fluoromachine")
		end,
	},
}
