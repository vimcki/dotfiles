return {
	"jose-elias-alvarez/null-ls.nvim",
	lazy = true,
	config = function(_, _)
		local null_ls = require("null-ls")
		local formatting = null_ls.builtins.formatting
		null_ls.setup({
			sources = {
				formatting.golines,
				formatting.goimports,
			},
		})
	end,
}
