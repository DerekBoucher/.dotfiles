return {
	{
		"nvimtools/hydra.nvim",
		config = function()
			local hydra = require("hydra")
			hydra.setup({})

			--hydra({
			--	name = "Change / Resize / Manage Windows",
			--	mode = "n",
			--	body = "<C-w>",
			--	heads = {
			--		-- move between windows
			--		{ "<right>", "<C-w><right>" },
			--		{ "<left>", "<C-w><left>" },
			--		{ "<up>", "<C-w><up>" },
			--		{ "<down>", "<C-w><down>" },

			--		-- resize windows
			--		{ "H", "<C-w>3<" },
			--		{ "L", "<C-w>3>" },
			--		{ "K", "<C-w>2+" },
			--		{ "J", "<C-w>2-" },

			--		-- equalize window sizes
			--		{ "e", "<C-w>=" },

			--		-- Close the current window
			--		{ "q", "<C-w>q" },
			--	},
			--})

			--hydra({
			--	name = "Traverse buffers",
			--	mode = "n",
			--	body = "<leader>",
			--	heads = {
			--		{
			--			"<right>",
			--			"<leader><right>",
			--		},
			--		{ "<left>", "<leader><left>" },
			--	},
			--})
		end,
	},
}
