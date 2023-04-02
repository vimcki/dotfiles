local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

require('telescope').setup {
	defaults = {
		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			}
		}
	},
}

vim.keymap.set('n', '<leader>pf', builtin.fd, {})
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
vim.keymap.set('n', '<leader>pi', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pg', builtin.git_status, {})
vim.keymap.set('n', '<leader>pc', builtin.command_history, {})
vim.keymap.set('n', '<leader>ld', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>gc', builtin.git_bcommits, {})

vim.keymap.set('n', '<C-p>', function()
	local ok, _ = pcall(builtin.git_files)
	if not ok then
		builtin.find_files()
	end
end)

vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>pm', builtin.keymaps, {})


require('telescope').load_extension('fzf')
