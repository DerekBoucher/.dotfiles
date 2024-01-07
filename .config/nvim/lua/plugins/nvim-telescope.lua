return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				extension = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							--- opts
						}),
					},
					["workspaces"] = {
						-- opts
					},
				},
			})
			telescope.load_extension("ui-select")
			telescope.load_extension("workspaces")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}
