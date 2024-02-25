function ColorMyPencils(color)
	color = color or "catppuccin-mocha"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	-- Corrected Code
	if vim.g.gui_running then -- Check if it's a GUI version of Neovim
		vim.api.nvim_set_hl(0, "CursorLine", { guibg = "#2c323c" })
		vim.api.nvim_set_hl(0, "CursorColumn", { guibg = "#323840" })
	else
		vim.api.nvim_set_hl(0, "CursorLine", { ctermbg = 235, bg = "#2c323c" })
		vim.api.nvim_set_hl(0, "CursorColumn", { ctermbg = 236, bg = "#323840" })
	end
end

ColorMyPencils()
