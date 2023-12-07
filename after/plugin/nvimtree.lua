-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()


vim.keymap.set("n", "<leader>e", function()
    vim.cmd("NvimTreeToggle")
end)

vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeFocus)
vim.keymap.set("n", "<leader>pc", vim.cmd.NvimTreeCollapse)
