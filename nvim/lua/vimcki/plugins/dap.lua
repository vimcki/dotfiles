return {
	{
		'mfussenegger/nvim-dap',
		lazy = true,
		dependencies = {
			{ 'rcarriga/nvim-dap-ui' },
			{ 'theHamsta/nvim-dap-virtual-text' },
			{ 'leoluz/nvim-dap-go' },
			{ 'nvim-telescope/telescope-dap.nvim' },
		},
		keys = {
			{ "<leader>bb", ":lua require'dap'.toggle_breakpoint()<cr>",                                           "n" },
			{ "<leader>bc", ":lua require'dap'.continue()<cr>",                                                    "n" },
			{ "<leader>bo", ":lua require'dap'.step_over()<cr>",                                                   "n" },
			{ "<leader>bi", ":lua require'dap'.step_into()<cr>",                                                   "n" },
			{ "<leader>bu", ":lua require'dap'.step_out()<cr>",                                                    "n" },
			{ "<leader>br", ":lua require'dap'.repl.open()<cr>",                                                   "n" },
			{ "<leader>bt", ":lua require'dap'.run_to_cursor()<cr>",                                               "n" },
			{ "<leader>bs", ":lua require'dap'.disconnect()<cr>",                                                  "n" },
			{ "<leader>bl", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",        "n" },
			{ "<leader>bp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", "n" },
		},
		config = function()
			require('telescope').load_extension('dap')
			require('dap.ext.vscode').load_launchjs("launch.json", {})
		end
	},
	{
		'rcarriga/nvim-dap-ui',
		lazy = true,
		dependencies = {
			{ 'mfussenegger/nvim-dap' },
		},
		keys = {
			{ "<leader>bz", ":lua require'dapui'.toggle()<cr>", "n" },
		},
		config = function()
			vim.api.nvim_set_hl(0, 'debugPc', { bg = "#135065" })
			vim.api.nvim_set_hl(0, 'NvimDapVirtualText', { fg = "#BEE120" })
			require('dapui').setup(
				{
					controls = {
						element = "repl",
						enabled = true,
						icons = {
							disconnect = "",
							pause = "",
							play = "",
							run_last = "",
							step_back = "",
							step_into = "",
							step_out = "",
							step_over = "",
							terminate = ""
						}
					},
					element_mappings = {},
					expand_lines = true,
					floating = {
						border = "single",
						mappings = {
							close = { "q", "<Esc>" }
						}
					},
					force_buffers = true,
					icons = {
						collapsed = "",
						current_frame = "",
						expanded = ""
					},
					layouts = { {
						elements = { {
							id = "scopes",
							size = 0.25
						}, {
							id = "breakpoints",
							size = 0.25
						}, {
							id = "stacks",
							size = 0.25
						}, {
							id = "watches",
							size = 0.25
						} },
						position = "left",
						size = 100
					}, {
						elements = { {
							id = "repl",
							size = 0.5
						}, {
							id = "console",
							size = 0.5
						} },
						position = "bottom",
						size = 10
					} },
					mappings = {
						edit = "e",
						expand = { "<CR>", "<2-LeftMouse>" },
						open = "o",
						remove = "d",
						repl = "r",
						toggle = "t"
					},
					render = {
						indent = 1,
						max_value_lines = 100
					}
				}
			)
		end
	},

	{
		'theHamsta/nvim-dap-virtual-text',
		lazy = true,
		config = function()
			require('nvim-dap-virtual-text').setup()
		end
	},
	{
		'leoluz/nvim-dap-go',
		lazy = true,
		config = function()
			require('dap-go').setup()
		end
	},
	{
		'nvim-telescope/telescope-dap.nvim',
		lazy = true,
	},
}
