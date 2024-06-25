return {
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({

				update_focused_file = {
					enable = true,
					update_root = {
						enable = true,
						ignore_list = {},
					},
					exclude = false,
				},

				sync_root_with_cwd = true,
				respect_buf_cwd = true,
				reload_on_bufenter = true,
			})
		end,
	},
}
