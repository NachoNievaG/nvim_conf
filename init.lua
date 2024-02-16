local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

require("options")
require("lazy").setup("plugins")
require("colors")
require("keymaps")

vim.cmd([[set titlestring=%t%(\ %M%)%(\ \(%{expand(\"%:~:h\")}\)%)%a\ -\ NVIM]])
