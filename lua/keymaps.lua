local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Better window navigation
keymap("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", opts)
keymap("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", opts)
keymap("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", opts)
keymap("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", opts)
-- Harpoon
keymap("n", "<leader>1", ":lua require('harpoon'):list():select(1)<CR>", opts)
keymap("n", "<leader>2", ":lua require('harpoon'):list():select(2)<CR>", opts)
keymap("n", "<leader>3", ":lua require('harpoon'):list():select(3)<CR>", opts)
keymap("n", "<leader>4", ":lua require('harpoon'):list():select(4)<CR>", opts)
keymap("n", "<leader>5", ":lua require('harpoon'):list():select(5)<CR>", opts)
keymap("n", "<leader>6", ":lua require('harpoon'):list():select(6)<CR>", opts)
keymap("n", "<leader>7", ":lua require('harpoon'):list():select(7)<CR>", opts)
keymap("n", "<leader>8", ":lua require('harpoon'):list():select(8)<CR>", opts)
keymap("n", "<leader>9", ":lua require('harpoon'):list():select(9)<CR>", opts)

-- Navigate harpooned
keymap("n", "<S-l>", ":lua require('harpoon'):list():prev()<CR>", opts)
keymap("n", "<S-h>", ":lua require('harpoon'):list():next()<CR>", opts)
--

keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "{", "{zzzv", opts)
keymap("n", "}", "}zzzv", opts)
keymap("n", "<C-d>", "<C-d>zzzv", opts)
keymap("n", "<C-u>", "<C-u>zzzv", opts)

keymap("n", "<Up>", ":resize +2<CR>", opts)
keymap("n", "<Down>", ":resize -2<CR>", opts)
keymap("n", "<Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

local builtin = require("telescope.builtin")
vim.keymap.set("n", "gr", builtin.lsp_references, { noremap = true, silent = true })
vim.keymap.set("n", "gi", builtin.lsp_implementations, { noremap = true, silent = true })
vim.keymap.set("n", "gd", builtin.lsp_definitions, { noremap = true, silent = true })
vim.keymap.set("n", "gb", builtin.buffers, opts)
keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
keymap("n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
keymap("n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

-- copilot --
keymap("i", "ı", "<cmd>call copilot#Previous()<CR>", opts)
keymap("i", "ø", "<cmd>call copilot#Next()<CR>", opts)
vim.cmd([[imap <silent><script><expr> π copilot#Accept("\<CR>")]])
