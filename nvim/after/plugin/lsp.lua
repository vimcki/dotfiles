local telescope = require("telescope.builtin")
local null_ls = require("null-ls")

local lsp = require('lsp-zero').preset({
	name = 'minimal',
	set_lsp_keymaps = false,
	manage_nvim_cmp = true,
	suggest_lsp_servers = false,
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
	['<CR>'] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil
cmp_mappings['<C-f>'] = nil

function Print_cn(client)
	return true
end

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format({filter = Print_cn})]]

local formatting = null_ls.builtins.formatting

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		formatting.golines,
		formatting.goimports,
	},
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end
			})
		end
	end,
})

vim.cmd [[autocmd BufEnter,BufNew *.rs :compiler cargo]]

lsp.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "<C-g>", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "<leader>lj", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "<leader>lk", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>lr", function() telescope.lsp_references() end, opts)
	vim.keymap.set("n", "<leader>li", function() telescope.lsp_implementations() end, opts)
	vim.keymap.set("n", "<leader>ls", function() telescope.lsp_dynamic_workspace_symbols() end, opts)
	vim.keymap.set("n", "<leader>ln", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("n", "<leader>lt", function() vim.lsp.buf.type_definition() end, opts)
	vim.keymap.set("i", "<C-s>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.nvim_workspace()

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.setup()

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

require('lspconfig').cucumber_language_server.setup({
	settings = {
		cucumber = {
			features = { 'test/bdd/features/*.feature' },
			glue = { 'test/bdd/bdd_test.go' }
		}
	}
})
