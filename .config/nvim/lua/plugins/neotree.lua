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
				filters = {
					enable = true,
					git_ignored = false,
					dotfiles = false,
					git_clean = false,
					no_buffer = false,
					no_bookmark = false,
					custom = {},
					exclude = {},
				},

				update_focused_file = {
					enable = true,
					update_root = {
						enable = true,
						ignore_list = {},
					},
					exclude = false,
				},

				sync_root_with_cwd = false,
				respect_buf_cwd = false,
				reload_on_bufenter = true,
				prefer_startup_root = false,
			})
		end,
	},
}
