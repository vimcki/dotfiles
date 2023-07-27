vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
	space_char_blankline = " ",
	show_current_context = true,
	show_current_context_start = true,
}

vim.api.nvim_set_hl(0, 'IndentBlanklineContextStart', { bg = '#252525' })
vim.api.nvim_set_hl(0, 'IndentBlanklineChar', {})
vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceChar', {})
vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceCharBlankline', {})
vim.api.nvim_set_hl(0, 'IndentBlanklineContextChar', { fg = '#702020' })
vim.api.nvim_set_hl(0, 'IndentBlanklineContextSpaceChar', {})
vim.api.nvim_set_hl(0, 'IndentBlanklineContextSpaceCharBlankline', {})
