local o = vim.opt
o.backup = false
o.clipboard = "unnamedplus"
o.cmdheight = 1
o.completeopt = { "menuone", "noselect" }
o.conceallevel = 0
o.fileencoding = "utf-8"
o.hlsearch = false
o.ignorecase = true
o.mouse = "a"
o.pumheight = 10
o.showmode = false
o.smartcase = true
o.smartindent = true
o.splitbelow = true
o.splitright = true
o.swapfile = false
o.termguicolors = true
o.timeoutlen = 1000
o.undofile = true
o.updatetime = 300
o.writebackup = false
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.guicursor = ""
o.cursorline = true
o.number = true
o.relativenumber = true
o.numberwidth = 4
o.signcolumn = "yes"
o.wrap = false
o.scrolloff = 8
o.sidescrolloff = 8
o.guifont = "monospace:h17"
o.timeoutlen = 50
o.foldmethod = "indent"
o.foldnestmax = 3
o.foldlevelstart = 99
vim.g.timeoutlen = 150
vim.g.vimtex_view_method = "zathura"
vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = false,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

o.shortmess:append("c")

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})
vim.o.background = "dark"
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]])
vim.cmd([[set fo-=r]])

vim.cmd([[highlight CopilotSuggestion guifg=#555555 ctermfg=8]])
vim.cmd([[:command YankFileRelativePath :let @+ = fnamemodify(expand("%"), ":~:.")]])
