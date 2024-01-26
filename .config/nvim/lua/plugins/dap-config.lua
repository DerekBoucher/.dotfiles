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
		"nvim-telescope/telescope-dap.nvim",
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

			local codelldb = require("mason-registry").get_package("codelldb")
			local extension_path = codelldb:get_install_path() .. "/extension/"
			local codelldb_path = extension_path .. "adapter/codelldb"

			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = codelldb_path,
					args = { "--port", "${port}" },
				},
			}

			dap.adapters.go_remote = function(cb, config)
				cb({
					type = "server",
					port = config.port,
					substitutePath = config.substitutePath,
					executable = {
						command = "dlv",
						args = { "connect", "127.0.0.1:" .. config.port },
					},
				})
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

			dap.configurations["rust"] = {
				{
					name = "rust-launch-debug",
					request = "launch",
					type = "codelldb",
					cwd = "${workspaceFolder}",
					cargo = {
						args = { "build", "--all-features" },
					},
					program = function()
						return vim.fn.input({ "Path to executable:", vim.fn.getcwd() .. "/", "file" })
					end,
					sourceLanguages = { "rust" },
					stopOnEntry = false,
					environment = { "RUST_LOG=debug" },
				},
			}

			dap.configurations["c"] = {
				{
					name = "rust-launch-debug",
					request = "launch",
					type = "codelldb",
					cwd = "${workspaceFolder}",
					program = "${workspaceFolder}/target/debug/rusty_fuugbemu",
					stopOnEntry = false,
				},
			}

			dap.configurations["cpp"] = {
				{
					name = "rust-launch-debug",
					request = "launch",
					type = "codelldb",
					cwd = "${workspaceFolder}",
					program = "${workspaceFolder}/target/debug/rusty_fuugbemu",
					stopOnEntry = false,
				},
			}

			dap.configurations["go"] = {
				{
					name = "Chubb BOP Docker Debug",
					request = "attach",
					type = "go_remote",
					mode = "remote",
					substitutePath = {
						{
							from = "${workspaceFolder}/service",
							to = "/tmp/gobuild",
						},
					},
					port = function()
						return vim.fn.input("Port: ")
					end,
				},
				{
					name = "Chubb WC Docker Debug",
					request = "attach",
					type = "go_remote",
					mode = "remote",
					substitutePath = {
						{
							from = "${workspaceFolder}/service",
							to = "/tmp/gobuild",
						},
					},
					port = function()
						return vim.fn.input("Port: ")
					end,
				},
				{
					name = "Cowbell Docker Debug",
					request = "attach",
					type = "go_remote",
					mode = "remote",
					substitutePath = {
						{
							from = "${workspaceFolder}/service",
							to = "/tmp/gobuild",
						},
					},
					port = function()
						return vim.fn.input("Port: ")
					end,
				},
			}
		end,
	},
}
