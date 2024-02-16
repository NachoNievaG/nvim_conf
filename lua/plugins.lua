return {
	-- Oneliners
	{ "nvim-telescope/telescope-ui-select.nvim" },
	{ "christoomey/vim-tmux-navigator" },
	{ "github/copilot.vim" },
	{ "rebelot/kanagawa.nvim", priority = 1000 },
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				contrast = "hard",
				palette_overrides = {
					gray = "#2eb542", -- comments are GREEN
				},
			})
		end,
		opts = ...,
	},
	{ "tpope/vim-fugitive" },
	{ "folke/neodev.nvim", opts = {} },
	{ "simrat39/rust-tools.nvim" },
	{
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = false,
					theme = "onedark",
					component_separators = "|",
					section_separators = "",
				},
			})
		end,
	},
	-- Setup based
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup({})

			-- basic telescope configuration
			local conf = require("telescope.config").values
			local function toggle_telescope(harpoon_files)
				local file_paths = {}
				for _, item in ipairs(harpoon_files.items) do
					table.insert(file_paths, item.value)
				end

				require("telescope.pickers")
					.new({}, {
						prompt_title = "Harpoon",
						finder = require("telescope.finders").new_table({
							results = file_paths,
						}),
						previewer = conf.file_previewer({}),
						sorter = conf.generic_sorter({}),
					})
					:find()
			end

			vim.keymap.set("n", "<leader>mo", function()
				toggle_telescope(harpoon:list())
			end, { desc = "Open harpoon window" })
		end,
	},
	--LSP
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				modules = {},
				auto_install = true,
				sync_install = false,
				ensure_installed = { "lua", "vim", "go", "bash", "markdown", "markdown_inline" },
				ignore_install = {},
				highlight = { enable = true },
				indent = { enable = true },
				incremental_selection = { enable = true },
				refactor = { highlight_definitions = { enable = true } },
			})
		end,
	},
	-- Git
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},

	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- DAP
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap" },
		init = function()
			require("dapui").setup()
		end,
	},
	{
		"leoluz/nvim-dap-go",
		init = function()
			require("dap-go").setup()
		end,
	},

	-- LSP Support
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
		},
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "L3MON4D3/LuaSnip" },
		},
	},

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local lsp_zero = require("lsp-zero")

			lsp_zero.extend_lspconfig()
			lsp_zero.on_attach(function(client, bufnr)
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)

			local rust_lsp = lsp_zero.build_options("rust_analyzer", {})

			lsp_zero.setup()
			-- Initialize rust_analyzer with rust-tools
			require("rust-tools").setup({ server = rust_lsp })

			require("mason").setup({})
			require("mason-lspconfig").setup({
				ensure_installed = { "gopls", "dockerls", "bashls", "lua_ls" },
				handlers = {
					lsp_zero.default_setup,
				},
			})

			local cmp = require("cmp")
			cmp.setup({
				mapping = {
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.close(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
				},
			})
		end,
	},

	-- db
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = { "tpope/vim-dadbod" },
		config = function()
			vim.g.db_ui_force_echo_notifications = 0
			vim.g.db_ui_save_location = os.getenv("HOME") .. "/.config/db_ui_queries"
			vim.g.db_ui_auto_execute_table_helpers = 1
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	},

	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({})
		end,
	},

	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	{
		"folke/zen-mode.nvim",
		opts = {},
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
		config = function()
			require("Comment").setup()
		end,
	},
}
