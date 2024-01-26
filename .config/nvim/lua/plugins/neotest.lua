return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"rouge8/neotest-rust",
			"nvim-neotest/neotest-go",
		},
		config = function()
			require("neotest").setup({
				log_level = 1,
				adapters = {
					require("neotest-rust")({
						dap_adapter = "codelldb",
					}),
					require("neotest-go"),
				},
			})
		end,
	},
}
