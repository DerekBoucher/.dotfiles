vim.g.mapleader = " "

-- Initialize lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- theme
vim.cmd("colorscheme tokyonight-night")

-- Vim specific configurations
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")

-- Move line(s) up or down
vim.keymap.set("n", "<A-down>", ":m .+1<CR>")
vim.keymap.set("n", "<A-up>", ":m .-2<CR>")
vim.keymap.set("v", "<A-down>", ":m '>+1<CR>`[V`]")
vim.keymap.set("v", "<A-up>", ":m .-2<CR>`[V`]")
vim.keymap.set("v", "<C-c>", '"+y')

-- tab
vim.keymap.set("n", "<leader>nt", ":tabnew<CR>")
vim.keymap.set("n", "<leader><right>", ":tabnext<CR>")
vim.keymap.set("n", "<leader><left>", ":tabprev<CR>")
