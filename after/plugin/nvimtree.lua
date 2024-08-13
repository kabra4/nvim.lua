-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
	-- Your existing configuration ...

	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
	filters = {
		dotfiles = true,
	},
})

vim.keymap.set("n", "<leader>eo", vim.cmd.NvimTreeFindFile, { desc = "Open NvimTree at file location" })
vim.keymap.set("n", "<leader>ec", vim.cmd.NvimTreeClose, { desc = "Close NvimTree" })
vim.keymap.set("n", "<leader>et", vim.cmd.NvimTreeToggle, { desc = "Toggle NvimTree" })
