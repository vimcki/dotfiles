-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	use({ 'rose-pine/neovim', as = 'rose-pine' })
	use({ 'rebelot/kanagawa.nvim', as = 'kanagawa' })
	use({ 'Mofiqul/dracula.nvim', as = 'dracula' })
	use({ 'ful1e5/onedark.nvim' })

	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
	use('nvim-treesitter/playground')
	use('nvim-treesitter/nvim-treesitter-context')

	use('theprimeagen/harpoon')

	use('mbbill/undotree')

	use('tpope/vim-fugitive')
	use {
		'lewis6991/gitsigns.nvim',
		-- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
	}

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },          -- Required
			{ 'williamboman/mason.nvim' },        -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },      -- Required
			{ 'hrsh7th/cmp-nvim-lsp' },  -- Required
			{ 'hrsh7th/cmp-buffer' },    -- Optional
			{ 'hrsh7th/cmp-path' },      -- Optional
			{ 'saadparwaiz1/cmp_luasnip' }, -- Optional
			{ 'hrsh7th/cmp-nvim-lua' },  -- Optional

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },          -- Required
			{ 'rafamadriz/friendly-snippets' }, -- Optional
		}
	}

	use {
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}

	use {
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" }
		}
	}
	use { 'ThePrimeagen/vim-be-good' }
	use { 'eandrju/cellular-automaton.nvim' }
	use { "github/copilot.vim" }

	use({
		"jackMort/ChatGPT.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim"
		}
	})

	use({
		"jose-elias-alvarez/null-ls.nvim",
	})

	use {
		'yanskun/gotests.nvim',
		ft = 'go',
		config = function()
			require('gotests').setup()
		end
	}
end)
