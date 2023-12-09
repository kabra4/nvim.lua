-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()


vim.keymap.set("n", "<leader>eo", vim.cmd.NvimTreeFindFile)
vim.keymap.set("n", "<leader>ec", vim.cmd.NvimTreeClose)
vim.keymap.set("n", "<leader>et", vim.cmd.NvimTreeToggle)

