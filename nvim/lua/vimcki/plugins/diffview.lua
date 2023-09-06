return
{
	"sindrets/diffview.nvim",
	lazy = true,
	config = function()
		vim.api.nvim_set_hl(0, 'DiffAdd', { bg = '#2d4c2d' })
		vim.api.nvim_set_hl(0, 'DiffChange', { bg = '#2d4c2d' })
		vim.api.nvim_set_hl(0, 'DiffText', { bg = '#31632e' })
	end,
}
