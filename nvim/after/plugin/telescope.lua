local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

local transform_mod = require("telescope.actions.mt").transform_mod
local mod = {}
mod.open_first_qf = function(_)
	vim.cmd [[cfirst]]
end
mod = transform_mod(mod)

local smart_send_to_qf = actions.smart_send_to_qflist + mod.open_first_qf

require('telescope').setup {
	defaults = {
		layout_config = {
			width = 0.95,
			height = 0.95,
			preview_width = 100,
		},
		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				["<C-q>"] = smart_send_to_qf,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			}
		}
	},
	extensions = {
		fzf = {
			fuzzy = true,                -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case",    -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		}
	},
}

vim.keymap.set('n', '<leader>pf', builtin.fd, {})
vim.keymap.set('n', '<leader>ph', builtin.help_tags, {})
vim.keymap.set('n', '<leader>pi', builtin.live_grep, {})
vim.keymap.set('n', '<leader>pg', builtin.git_status, {})
vim.keymap.set('n', '<leader>pc', builtin.command_history, {})
vim.keymap.set('n', '<leader>ld', builtin.diagnostics, {})
vim.keymap.set('n', '<leader>pb', builtin.git_bcommits, {})
vim.keymap.set('n', '<leader>pm', builtin.keymaps, {})

vim.keymap.set('n', '<C-p>', function()
	local ok, _ = pcall(builtin.git_files)
	if not ok then
		builtin.find_files()
	end
end)

vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)


vim.keymap.set('n', '<leader>pu', function()
	builtin.grep_string({
		search = '',
		file_ignore_patterns = { "swaggerui/**" },
	})
end)

require("telescope").load_extension("ui-select")
require('telescope').load_extension('fzf')
