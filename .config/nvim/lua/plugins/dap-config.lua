return {
	{
		"mxsdev/nvim-dap-vscode-js",
		config = function()
			require("dap-vscode-js").setup({
				adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
				node_path = os.getenv("NVM_BIN") .. "/node",
				debugger_path = os.getenv("HOME") .. "/.cache/nvim/vscode-js-debug",
			})
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			dapui.setup()

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end

			dap.listeners.after.event_terminated["dapui_config"] = function()
				dapui.close()
			end

			dap.listeners.after.event_exited["dapui_config"] = function()
				dapui.close()
			end

			local js_based_languages = { "typescript", "javascript", "typescriptreact" }

			for _, language in ipairs(js_based_languages) do
				dap.configurations[language] = {
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch file",
						program = "${file}",
						cwd = "${workspaceFolder}",
					},
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach",
						processId = require("dap.utils").pick_process,
						cwd = "${workspaceFolder}",
					},
					{
						type = "pwa-chrome",
						request = "launch",
						name = 'Start Chrome with "localhost"',
						url = "http://localhost:3000",
						webRoot = "${workspaceFolder}",
						userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
					},
				}
			end
			vim.keymap.set("n", "<F5>", require("dap").continue)
			vim.keymap.set("n", "<F10>", require("dap").step_over)
			vim.keymap.set("n", "<F11>", require("dap").step_into)
			vim.keymap.set("n", "<F12>", require("dap").step_out)
			vim.keymap.set("n", "<leader>b", require("dap").toggle_breakpoint)
			vim.keymap.set("n", "<leader>B", function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end)
		end,
	},
}
