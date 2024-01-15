local keymaps = {}

function keymaps.setup()
	-- LSP
	vim.keymap.set("n", "<leader>lr", ":LspRestart<CR>")

	-- Code Editting
	vim.keymap.set("n", "<A-down>", ":m .+1<CR>")
	vim.keymap.set("n", "<A-up>", ":m .-2<CR>")
	vim.keymap.set("v", "<A-down>", ":m '>+1<CR>`[V`]")
	vim.keymap.set("v", "<A-up>", ":m .-2<CR>`[V`]")
	vim.keymap.set("v", "<C-c>", '"+y')
	vim.keymap.set("n", "<C-s>", "<Cmd>:w<CR>")
	vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
	vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
	vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
	vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {})
	vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {})
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

	local trouble = require("trouble")

	vim.keymap.set("n", "<leader>xx", function()
		trouble.toggle()
	end)

	-- Windows / Tabs / Navigation
	vim.keymap.set("n", "<leader>nt", ":tabnew<CR>")
	vim.keymap.set("n", "<leader><right>", "<Cmd>BufferNext<CR>")
	vim.keymap.set("n", "<leader><left>", "<Cmd>BufferPrevious<CR>")
	vim.keymap.set("n", "<A-left>", "<Cmd>BufferMovePrevious<CR>")
	vim.keymap.set("n", "<A-right>", "<Cmd>BufferMoveNext<CR>")
	vim.keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>")
	vim.keymap.set("n", "<leader>t", ":Neotree toggle<CR>", {})
	vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
	vim.keymap.set("n", "<C-r>", ":Telescope workspaces<CR>")

	local builtin = require("telescope.builtin")
	vim.keymap.set("n", "<C-p>", builtin.find_files, {})
	vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})

	-- Debugging
	vim.keymap.set("n", "<F5>", require("dap").continue)
	vim.keymap.set("n", "<F10>", require("dap").step_over)
	vim.keymap.set("n", "<F11>", require("dap").step_into)
	vim.keymap.set("n", "<F12>", require("dap").step_out)
	vim.keymap.set("n", "<leader>b", require("dap").toggle_breakpoint)
	vim.keymap.set("n", "<leader>B", function()
		require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
	end)
	vim.keymap.set("n", "<leader>cd", function()
		require("dapui").toggle()
	end)

	-- Terminal
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)

	-- Workspaces
	local workspaces = require("workspaces")
	vim.keymap.set("n", "<leader>aw", function()
		workspaces.add(vim.fn.getcwd())
	end)
end

return keymaps
