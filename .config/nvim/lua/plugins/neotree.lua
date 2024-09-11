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
				view = {
					centralize_selection = false,
					cursorline = true,
					debounce_delay = 15,
					side = "left",
					preserve_window_proportions = false,
					number = false,
					relativenumber = false,
					signcolumn = "yes",
					width = 50,
					float = {
						enable = false,
						quit_on_focus_loss = true,
						open_win_config = {
							relative = "editor",
							border = "rounded",
							width = 30,
							height = 30,
							row = 1,
							col = 1,
						},
					},
				},

				update_focused_file = {
					enable = true,
					update_root = {
						enable = false,
						ignore_list = {},
					},
					exclude = false,
				},

				sync_root_with_cwd = true,
				respect_buf_cwd = false,
				reload_on_bufenter = true,
				prefer_startup_root = false,
			})
		end,
	},
}
