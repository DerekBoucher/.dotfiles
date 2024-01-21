return {
	{
		"natecraddock/workspaces.nvim",
		config = function()
			local workspaces = require("workspaces")
			workspaces.setup()

			vim.keymap.set("n", "<leader>af", function()
				workspaces.add(vim.fn.input("Path to add: "))
			end)
			-- vim.keymap.set("n", "<C-r>", workspaces.list_dirs, {})
			vim.keymap.set("n", "<leader>aw", function()
				workspaces.add(vim.fn.getcwd())
			end)
		end,
	},
}
