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

require("treesitter_indent_object").setup()

-- select context-aware indent
vim.keymap.set({ "x", "o" }, "ai", "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_outer()<CR>")
-- ensure selecting entire line (or just use Vai)
vim.keymap.set({ "x", "o" }, "aI", "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_outer(true)<CR>")
-- select inner block (only if block, only else block, etc.)
vim.keymap.set({ "x", "o" }, "ii", "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_inner()<CR>")
-- select entire inner range (including if, else, etc.)
vim.keymap.set({ "x", "o" }, "iI", "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_inner(true)<CR>")
