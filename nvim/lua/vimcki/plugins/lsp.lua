local telescope = require("telescope.builtin")

return {
	{
		'VonHeikemen/lsp-zero.nvim',
		lazy = true,
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },          -- Required
			{ 'williamboman/mason.nvim' },        -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional
			{ "jose-elias-alvarez/null-ls.nvim" },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },  -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'L3MON4D3/LuaSnip' },  -- Required
		},
		config = function()
			-- This is where you modify the settings for lsp-zero
			-- Note: autocompletion settings will not take effect

			require('lsp-zero.settings').preset({
				name = 'minimal',
				set_lsp_keymaps = false,
				manage_nvim_cmp = true,
				suggest_lsp_servers = false,
			})
		end
	},
	{
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		dependencies = {
			{ 'L3MON4D3/LuaSnip' },
		},
		config = function()
			-- Here is where you configure the autocompletion settings.
			-- The arguments for .extend() have the same shape as `manage_nvim_cmp`:
			-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/api-reference.md#manage_nvim_cmp

			require('lsp-zero.cmp').extend()

			-- And you can configure cmp even more, if you want to.
			local cmp = require('cmp')
			local cmp_action = require('lsp-zero.cmp').action()

			cmp.setup({
				mapping = {
					['<C-f>'] = cmp_action.luasnip_jump_forward(),
					['<C-b>'] = cmp_action.luasnip_jump_backward(),
					['<C-k>'] = cmp.mapping.select_next_item(),
					['<C-j>'] = cmp.mapping.select_prev_item(),
					['<CR>'] = cmp.mapping.confirm({ select = true }),
					["<C-Space>"] = cmp.mapping.complete(),
					['<Tab>'] = nil,
					['<S-Tab>'] = nil,
				}
			})
		end
	},

	{
		'neovim/nvim-lspconfig',
		cmd = 'LspInfo',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'williamboman/mason-lspconfig.nvim' },
			{ 'williamboman/mason.nvim' },
		},
		config = function()
			-- This is where all the LSP shenanigans will live

			local lsp = require('lsp-zero')

			vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

			vim.cmd [[autocmd BufEnter,BufNew *.rs :compiler cargo]]


			lsp.on_attach(function(client, bufnr)
				local opts = { buffer = bufnr, remap = false }


				vim.keymap.set("n", "<C-g>", function() vim.lsp.buf.definition() end, opts)
				vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
				vim.keymap.set("n", "<leader>lws", function() vim.lsp.buf.workspace_symbol() end, opts)
				vim.keymap.set("n", "<leader>lf", function() vim.diagnostic.open_float() end, opts)
				vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
				vim.keymap.set("n", "<leader>lr", function() telescope.lsp_references() end, opts)
				vim.keymap.set("n", "<leader>li", function() telescope.lsp_implementations() end, opts)
				vim.keymap.set("n", "<leader>ls", function() telescope.lsp_dynamic_workspace_symbols() end, opts)
				vim.keymap.set("n", "<leader>le", function() telescope.lsp_document_symbols() end, opts)
				vim.keymap.set("n", "<leader>ln", function() vim.lsp.buf.rename() end, opts)
				vim.keymap.set("n", "<leader>lt", function() vim.lsp.buf.type_definition() end, opts)
				vim.keymap.set("i", "<C-s>", function() vim.lsp.buf.signature_help() end, opts)
				vim.keymap.set("n", "<leader>ll", ":LspRestart<CR>", opts)

				local function len(t)
					local n = 0

					for _ in pairs(t) do
						n = n + 1
					end
					return n
				end

				vim.keymap.set("n", "<C-j>", function()
					local quickfix_size = len(vim.fn.getqflist())
					print(quickfix_size)
					if quickfix_size ~= 0 then
						vim.cmd("cnext")
						vim.cmd("normal zz")
						return
					end
					vim.diagnostic.goto_next()
				end)

				vim.keymap.set("n", "<C-k>", function()
					local quickfix_size = len(vim.fn.getqflist())
					print(quickfix_size)
					if quickfix_size ~= 0 then
						vim.cmd("cprev")
						vim.cmd("normal zz")
						return
					end
					vim.diagnostic.goto_prev()
				end)
			end)

			-- (Optional) Configure lua language server for neovim
			require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

			lsp.nvim_workspace()

			lsp.setup_nvim_cmp({
				mapping = cmp_mappings
			})

			vim.diagnostic.config({
				virtual_text = true
			})

			require('lspconfig').gopls.setup({
				settings = {
					gopls = {
						gofumpt = true
					}
				}
			})

			lsp.configure("yamlls", {
				settings = {
					yaml = {
						keyOrdering = false
					}
				}
			})

			lsp.setup()
		end
	}
}
