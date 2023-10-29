-- vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

require("ibl").setup {}

vim.api.nvim_set_hl(0, '@ibl.scope.underline.1', { bg = '#252525' })
vim.api.nvim_set_hl(0, '@ibl.scope.char.1', { fg = '#702020' })

require("treesitter_indent_object").setup()

-- select context-aware indent
vim.keymap.set({ "x", "o" }, "ai", "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_outer()<CR>")
-- ensure selecting entire line (or just use Vai)
vim.keymap.set({ "x", "o" }, "aI", "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_outer(true)<CR>")
-- select inner block (only if block, only else block, etc.)
vim.keymap.set({ "x", "o" }, "ii", "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_inner()<CR>")
-- select entire inner range (including if, else, etc.)
vim.keymap.set({ "x", "o" }, "iI", "<Cmd>lua require'treesitter_indent_object.textobj'.select_indent_inner(true)<CR>")
