function ColorMyPencils(color)
    color = color or "catppuccin-mocha"
	--color = color or "kanagawa"
	vim.cmd.colorscheme(color)

	--vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	--vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

	vim.api.nvim_set_hl(0, "CursorLine", { ctermbg = 235, bg = "#2c323c" })
	vim.api.nvim_set_hl(0, "CursorColumn", { ctermbg = 236, bg = "#323840" })
end

ColorMyPencils()
