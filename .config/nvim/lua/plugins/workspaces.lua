return {
	{
		"natecraddock/workspaces.nvim",
		config = function()
			local workspaces = require("workspaces")
			workspaces.setup()
		end,
	},
}
