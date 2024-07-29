local crates = require("crates")
crates.setup()
crates.show()

vim.keymap.set("n", "<leader>uac", function()
	crates.upgrade_all_crates()
end, { noremap = true, silent = true })
