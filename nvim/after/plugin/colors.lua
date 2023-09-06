local api = vim.api

-- Highlight on yank
local yankGrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank()",
	group = yankGrp,
})

function ColorMyPencils(color)
	color = color or "dracula"
	vim.cmd.colorscheme(color)
end

ColorMyPencils()
