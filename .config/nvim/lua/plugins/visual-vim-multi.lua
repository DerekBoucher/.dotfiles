return {
	{
		"mg979/vim-visual-multi",
		lazy = false,
		init = function()
			vim.g.VM_Maps = nil
			vim.g.VM_maps = {
				["Find Under"] = "<C-l>",
				["Find Subword Under"] = "<C-l>",
				["Select Cursor Down"] = "<M-C-Down>",
				["Select Cursor Up"] = "<M-C-Up>",
			}
		end,
	},
}
