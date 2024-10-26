return {
	{
		"natecraddock/workspaces.nvim",
		config = function()
			local workspaces = require("workspaces")
			workspaces.setup({
				hooks = {
					open = function()
						vim.cmd("set title")
						vim.cmd("let &titlestring = fnamemodify(getcwd(), ':t')")
					end,
				},
			})
		end,
	},
}
