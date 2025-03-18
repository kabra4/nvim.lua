local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Find Git files" })
vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "List open buffers" })
vim.keymap.set("n", "<leader>pg", builtin.live_grep, { desc = "Search for a string in the project" })
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Grep for a string" })
--vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "List references to the symbol under the cursor" })
-- List all methods in the current file
vim.keymap.set("n", "<leader>im", function()
	builtin.lsp_document_symbols({ symbols = { "method" } })
end, { desc = "List all methods in the current file" })

vim.keymap.set("n", "<leader>im", function()
	require("telescope.builtin").lsp_document_symbols({
		symbols = { "method" },
	})
end, { desc = "List all methods in the current file" })
