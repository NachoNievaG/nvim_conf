local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}
local harpoon = require("harpoon")
local mappings = {
	["1"] = { "<CMD>lua require('harpoon'):list():select(1)<CR>", "which_key_ignore" },
	["2"] = { "<CMD>lua require('harpoon'):list():select(2)<CR>", "which_key_ignore" },
	["3"] = { "<CMD>lua require('harpoon'):list():select(3)<CR>", "which_key_ignore" },
	["4"] = { "<CMD>lua require('harpoon'):list():select(4)<CR>", "which_key_ignore" },
	["5"] = { "<CMD>lua require('harpoon'):list():select(5)<CR>", "which_key_ignore" },
	["6"] = { "<CMD>lua require('harpoon'):list():select(6)<CR>", "which_key_ignore" },
	["7"] = { "<CMD>lua require('harpoon'):list():select(7)<CR>", "which_key_ignore" },
	["8"] = { "<CMD>lua require('harpoon'):list():select(8)<CR>", "which_key_ignore" },
	["9"] = { "<CMD>lua require('harpoon'):list():select(9)<CR>", "which_key_ignore" },

	["c"] = { "<CMD>lua require('close_buffers').delete({type = 'this'})<CR>", "Close buffer" },
	["n"] = { "<CMD>lua require('close_buffers').delete({type = 'nameless'})<CR>", "Close no name" },
	["o"] = { "<CMD>lua require('close_buffers').delete({type = 'other'})<CR>", "Close other buffers" },
	["e"] = { "<CMD>Oil<CR>", "Explorer" },
	["w"] = { "<cmd>w!<CR>", "Save" },
	["q"] = { "<cmd>q<CR>", "Quit" },
	["W"] = { "<cmd>wa!<CR>", "Save & quit" },
	["Q"] = { "<cmd>q!<CR>", "Quit" },
	["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
	["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
	f = {
		name = "Telescope",
		f = { "<cmd>Telescope find_files <cr>", "Find files" },
		w = { "<cmd>Telescope live_grep <cr>", "Find Text" },
		h = { "<cmd>Telescope help_tags <cr>", "Find Help" },
		d = { "<cmd>Telescope diagnostics <cr>", "Find Diagnostics" },
		p = { "<cmd>TodoTelescope keywords=TODO,FIX <cr>", "Find Pendings" },
		n = { "<cmd>TodoTelescope keywords=NOTE,INFO <cr>", "Find Annotations" },
		b = { "<cmd>Telescope buffers<cr>", "Find buffers" },
		s = { "<cmd>Telescope git_status<cr>", "Git Status" },
		S = { "<cmd>Telescope git_stash<cr>", "Git Stash" },
		c = { "<cmd>Telescope commands<cr>", "Find Commands" },
		C = { "<cmd>Telescope git_bcommits<cr>", "Git Commits" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
	},
	g = {
		name = "Git",
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		s = { "<cmd>Git<cr>", "Git Status" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = { "<cmd>Gvdiffsplit<cr>", "Diff" },
		g = { "<cmd>LazyGit<cr>", "LazyGit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		P = { "<cmd>Lazydocker<cr>", "LazyDocker" },
	},
	x = {
		name = "Debugger",
		b = {
			function()
				require("dap").toggle_breakpoint()
			end,
			"Toggle Breakpoint",
		},
		B = {
			function()
				require("dap").clear_breakpoints()
			end,
			"Clear Breakpoints",
		},
		c = {
			function()
				require("dap").continue()
			end,
			"Continue",
		},
		i = {
			function()
				require("dap").step_into()
			end,
			"Step Into",
		},
		g = {
			function()
				require("dap-go").debug_test()
				require("dapui").toggle()
			end,
			"Debug Go Test",
		},
		l = {
			function()
				require("dapui").float_element("breakpoints")
			end,
			"List Breakpoints",
		},
		o = {
			function()
				require("dap").step_over()
			end,
			"Step Over",
		},
		q = {
			function()
				require("dap").close()
			end,
			"Close Session",
		},
		Q = {
			function()
				require("dap").terminate()
			end,
			"Terminate",
		},
		r = {
			function()
				require("dap").repl.toggle()
			end,
			"REPL",
		},
		s = {
			function()
				require("dapui").float_element("scopes")
			end,
			"Scopes",
		},
		t = {
			function()
				require("dapui").float_element("stacks")
			end,
			"Threads",
		},
		u = {
			function()
				require("dapui").toggle()
			end,
			"Toggle Debugger UI",
		},
		w = {
			function()
				require("dapui").float_element("watches")
			end,
			"Watches",
		},
		x = {
			function()
				require("dap.ui.widgets").hover()
			end,
			"Inspect",
		},
	},
	m = {
		name = "Harpoon",
		a = {
			function()
				harpoon:list():append()
			end,
			"Add File",
		},
		o = {
			function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end,
			"Menu",
		},
	},
	d = {
		name = "dadbod",
		b = { "<cmd>DBUIToggle<cr>", "Toggle" },
	},
	j = {
		name = "json",
		s = { "<cmd>%!jq '.'<cr>", "Format" },
	},
}

return {
	"folke/which-key.nvim",
	config = function()
		require("which-key").setup({

			plugins = {
				marks = false, -- shows a list of your marks on ' and `
				registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
				-- the presets plugin, adds help for a bunch of default keybindings in Neovim
				-- No actual key bindings are created
				spelling = {
					enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
				},
				presets = {
					operators = false, -- adds help for operators like d, y, ...
					motions = false, -- adds help for motions
					text_objects = false, -- help for text objects triggered after entering an operator
					windows = false, -- default bindings on <c-w>
					nav = false, -- misc bindings to work with windows
					z = false, -- bindings for folds, spelling and others prefixed with z
					g = false, -- bindings for prefixed with g
				},
			},
		})

		require("which-key").register(mappings, opts)
	end,
}
