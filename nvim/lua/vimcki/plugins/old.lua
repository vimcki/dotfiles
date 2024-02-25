return {
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.2',
		dependencies = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-telescope/telescope-fzf-native.nvim' },
		},
		event = "VeryLazy",
	},

	{
		'williamboman/mason.nvim',
		config = function()
			require('mason').setup({})
		end,
	},
	{
		'williamboman/mason-lspconfig.nvim',
		config = function()
			require('mason-lspconfig').setup({})
		end,
	},

	{ "stevearc/dressing.nvim" },
	{ 'nvim-telescope/telescope-ui-select.nvim' },

	{ 'Mofiqul/dracula.nvim',                     name = 'dracula' },
	{ 'nvim-treesitter/nvim-treesitter',          build = ':TSUpdate' },

	{
		'nvim-treesitter/playground',
		event = "VeryLazy",
	},
	{ 'nvim-treesitter/nvim-treesitter-context', event = "VeryLazy" },
	{ 'theprimeagen/harpoon',                    event = "VeryLazy" },
	{ 'mbbill/undotree',                         event = "VeryLazy" },
	{ 'tpope/vim-fugitive',                      event = "VeryLazy" },
	{ 'lewis6991/gitsigns.nvim',                 event = "VeryLazy" },

	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		event = "VeryLazy",
		config = function()
			require("trouble").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	},

	{ 'ThePrimeagen/vim-be-good', event = "VeryLazy" },
	{ "github/copilot.vim",       event = "VeryLazy" },

	{
		'yanskun/gotests.nvim',
		event = "VeryLazy",
		ft = 'go',
		config = function()
			require('gotests').setup()
		end
	},

	{ 'vim-test/vim-test',     event = "VeryLazy" },
	{ 'numToStr/Comment.nvim', event = "VeryLazy" },
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		main = "ibl",
		opts = {},
	},
	{ "kiyoon/treesitter-indent-object.nvim", event = "VeryLazy" },
	{ "RRethy/nvim-treesitter-textsubjects",  event = "VeryLazy" },

}
