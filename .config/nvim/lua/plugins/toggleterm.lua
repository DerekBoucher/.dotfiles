return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<C-\>]],
				hide_numbers = true,
				direction = "float",
				autochdir = true,
			})
		end,
	},
}
