return {
	'renerocksai/telekasten.nvim',
	dependencies = { 'nvim-telescope/telescope.nvim' },
	config = {
		home = vim.fn.expand("~/zettelkasten"), -- Put the name of your notes directory here
	},
	keys = {
		{ "<leader>z",  "<cmd>Telekasten panel<CR>",              "n" },
		{ "<leader>zf", "<cmd>Telekasten find_notes<CR>",         "n" },
		{ "<leader>zg", "<cmd>Telekasten search_notes<CR>",       "n" },
		{ "<leader>zd", "<cmd>Telekasten goto_today<CR>",         "n" },
		{ "<leader>zz", "<cmd>Telekasten follow_link<CR>",        "n" },
		{ "<leader>zn", "<cmd>Telekasten new_note<CR>",           "n" },
		{ "<leader>zc", "<cmd>Telekasten show_calendar<CR>",      "n" },
		{ "<leader>zb", "<cmd>Telekasten show_backlinks<CR>",     "n" },
		{ "<leader>zI", "<cmd>Telekasten insert_img_link<CR>",    "n" },
		{ "<leader>zt", "<cmd>Telekasten new_templated_note<CR>", "n" },
	},
	config = function(_, opts)
		vim.cmd [[autocmd BufEnter,BufNew *.md :lua vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")]]
	end,
}
