-- Options
vim.g.mapleader = ' '
vim.opt.colorcolumn = { 80 }

-- Plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

-- Plugins
require("lazy").setup({

-- Cosmetics
-------------------------------------------------------------------------------

	-- Colorscheme
	{
		'navarasu/onedark.nvim',
		lazy = false,
		priority = 1000,
		opts = {
			style = 'light',
		},
		config = function()
			require('onedark').load()
		end,
	},


	-- Syntax highlighting
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function () 
			local configs = require('nvim-treesitter.configs')

			configs.setup({
				ensure_installed = 'all',
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = false },
			})
		end,
	},

	-- Statusline
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		lazy = false,
		opts = {},
	},

	-- Git gutters
	{
		'lewis6991/gitsigns.nvim',
		lazy = false,
		opts = {},
	},

	-- Bufferline
	{
		'akinsho/bufferline.nvim',
		dependencies = 'nvim-tree/nvim-web-devicons',
		version = "*",
		lazy = false,
		opts = {},
		keys = {
			{ 'H', '<cmd>bprev<cr>', desc = 'Previous buffer' },
			{ 'L', '<cmd>bnext<cr>', desc = 'Next buffer' },
		},
	},

	-- `TODO` comments
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = false,
		opts = {},
	},

-- Search & replace
-------------------------------------------------------------------------------

	-- File explorer
	{
		'stevearc/oil.nvim',
		opts = {},
		keys = {
			{'-', '<cmd>Oil<cr>', desc = "Open parent directory" },
		},
	},

	-- Fuzzy finder
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' },
		keys = {
			{ '<leader>f', '<cmd>Telescope find_files<cr>', desc = "Find files" },
			{ '<leader>/', '<cmd>Telescope live_grep<cr>', desc = "Search files" },
		},
	},

	-- Diagnostics
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},

-- Movement & Utilities
-------------------------------------------------------------------------------
	
	{
		'ggandor/leap.nvim',
		opts = {},
		keys = {
			{ 's', '<Plug>(leap)', mode = 'n', desc = 'Leap' },
		},
	},

	{
		'numToStr/Comment.nvim',
		lazy = false,
		opts = {},
	},

	{
		'nmac427/guess-indent.nvim',
		lazy = false,
		opts = {},
	},

-- TODO: LSP
-------------------------------------------------------------------------------

})
