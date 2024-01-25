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
				extension = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							--- opts
						}),
					},
					["workspaces"] = {
						-- opts
					},
					["dap-go"] = {},
				},
			})
			telescope.load_extension("ui-select")
			telescope.load_extension("workspaces")
			telescope.load_extension("dap")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
