return {
	{
		"rest-nvim/rest.nvim",
		dependencies = { { "nvim-lua/plenary.nvim" } },
		lazy = false,
		config = function()
			require("rest-nvim").setup({
				result = {
					show_url = true,
					show_curl_command = true,
					show_http_info = true,
					formatters = {
						json = "jq",
						html = function(body)
							return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
						end,
					},
				},
				env_file = os.getenv("HOME") .. "/src/github.com/embroker/http-stubs/.env.local",
				result_split_horizontal = true,
			})

			vim.cmd(":RestSelectEnv " .. os.getenv("HOME") .. "/src/github.com/embroker/http-stubs/.env.local")
		end,
	},
}
