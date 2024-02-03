return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				pickers = {
					find_files = {
						hidden = true,
						file_ignore_patterns = { ".git/*", "node_modules/*" },
						find_command = { "rg", "--ignore", "--hidden", "--files", "-u" },
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							--- opts
						}),
					},
					["workspaces"] = {
						-- opts
					},
					["emoji"] = {
						action = function(emoji)
							vim.api.nvim_put({ emoji.value }, "c", false, true)
						end,
					},
				},
			})
			telescope.load_extension("ui-select")
			telescope.load_extension("workspaces")
			telescope.load_extension("dap")
			telescope.load_extension("emoji")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "xiyaowong/telescope-emoji.nvim" },
	},
}
