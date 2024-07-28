local keymaps = {}

function keymaps.setup()
	-- Code Editting
	vim.keymap.set("n", "<A-down>", ":m .+1<CR>")
	vim.keymap.set("n", "<A-up>", ":m .-2<CR>")
	vim.keymap.set("v", "<A-down>", ":m '>+1<CR>`[V`]")
	vim.keymap.set("v", "<A-up>", ":m .-2<CR>`[V`]")
	vim.keymap.set("v", "<C-c>", '"+y')
	vim.keymap.set("n", "<C-s>", "<Cmd>:w<CR>")
	vim.keymap.set("i", "<C-s>", "<esc><Cmd>:w<CR>")
	vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
	vim.keymap.set(
		"n",
		"<leader>gd",
		vim.lsp.buf.definition,
		{ desc = "Goes to the definition of the symbol under the cursor" }
	)
	vim.keymap.set(
		"n",
		"<leader>gr",
		vim.lsp.buf.references,
		{ desc = "Lists all references to the symbol under the cursor" }
	)
	vim.keymap.set(
		"n",
		"<leader>gi",
		vim.lsp.buf.implementation,
		{ desc = "Goes to the implementation of the symbol under the cursor" }
	)
	vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Renames the symbol under the cursor" })
	vim.keymap.set(
		"n",
		"<leader>ca",
		vim.lsp.buf.code_action,
		{ desc = "Opens a window with code actions applicable to file" }
	)
	vim.keymap.set(
		"n",
		"<leader>e",
		vim.diagnostic.open_float,
		{ desc = "Opens the diagnostic message in a floating window" }
	)
	vim.keymap.set("", "<C-<leader>>", vim.lsp.buf.completion, {})

	-- Windows / Tabs / Navigation
	vim.keymap.set("n", "<leader>nt", ":tabnew<CR>")
	vim.keymap.set("n", "<leader><right>", ":tabnext<CR>")
	vim.keymap.set("n", "<leader><left>", ":tabprevious<CR>")
	vim.keymap.set("n", "<A-c>", ":tabclose<CR>")
	vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", {})
	vim.keymap.set("n", "<leader>w", ":Telescope workspaces<CR>")

	local builtin = require("telescope.builtin")
	vim.keymap.set("n", "<C-p>", builtin.find_files, {})
	vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
	vim.keymap.set("n", "<leader>st", builtin.colorscheme, {})
	vim.keymap.set("n", "<leader>lk", builtin.keymaps, {})
	vim.keymap.set("n", "<leader>lb", builtin.buffers, {})
	vim.keymap.set("n", "<leader>lqf", builtin.quickfix, {})
	vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, {})
	vim.keymap.set("n", "<leader>xx", builtin.diagnostics, {})
	vim.keymap.set("n", "<leader>em", ":Telescope emoji<CR>", { desc = "Pick an emoji to insert at cursor location" })

	-- Debugging
	vim.keymap.set("n", "<F5>", require("dap").continue)
	vim.keymap.set("n", "<F10>", require("dap").step_over)
	vim.keymap.set("n", "<F11>", require("dap").step_into)
	vim.keymap.set("n", "<F12>", require("dap").step_out)
	vim.keymap.set("n", "<leader>b", require("dap").toggle_breakpoint)
	vim.keymap.set("n", "<leader>cb", require("dap").clear_breakpoints)
	vim.keymap.set("n", "<leader>B", function()
		require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
	end)
	vim.keymap.set("n", "<leader>cd", function()
		require("dapui").toggle()
	end)

	-- Git
	vim.keymap.set("n", "<leader>o", "<cmd>OpenFileInRepo<cr>", { desc = "Open in web browser" })
	vim.keymap.set(
		"n",
		"<leader>O",
		"<cmd>OpenLineInRepo<cr>",
		{ desc = "Open in web browser, including current line" }
	)
	vim.keymap.set("n", "<leader>y", "<cmd>YankFileUrl +<cr>", { desc = "Yank Url to system clipboard" })
	vim.keymap.set(
		"n",
		"<leader>Y",
		"<cmd>YankLineUrl +<cr>",
		{ desc = "Yank Url to system clipboard, including current line" }
	)
	vim.keymap.set(
		"n",
		"<leader>gp",
		":Gitsigns preview_hunk<CR>",
		{ desc = "view the git change delimited by the selected hunk" }
	)
	vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "Opens a new window with git blame information" })
	vim.keymap.set("n", "<leader>k", ":Git diff<CR>", { desc = "Opens the current git diffs" })

	-- Terminal
	vim.keymap.set("t", "<C-space>", "<C-\\><C-n>", { desc = "Exit terminal mode, allowing for scrolling" })
	vim.keymap.set("t", "<C-up>", "<C-w><C-n><cmd>:resize +10<CR>", { desc = "Increase terminal window height" })
	vim.keymap.set("t", "<C-down>", "<C-w><C-n><cmd>:resize -10<CR>", { desc = "decrease terminal window height" })

	-- Workspaces
	local workspaces = require("workspaces")
	vim.keymap.set("n", "<leader>aw", function()
		workspaces.add(vim.fn.getcwd())
	end)

	-- JSON Editing
	vim.keymap.set("n", "<leader>je", ":JsonEscapeFile<CR>", { desc = "Escape JSON file" })
	vim.keymap.set("n", "<leader>ju", ":JsonUnescapeFile<CR>", { desc = "Unescape JSON file" })
end

return keymaps
