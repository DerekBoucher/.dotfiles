return {
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

			vim.keymap.set("n", "<leader>dt", ":DapToggleBreakpoint<CR>")
			vim.keymap.set("n", "<leader>dx", ":DapTerminated<CR>")
			vim.keymap.set("n", "<leader>do", ":DapStepOver<CR>")
		end,
	},
}