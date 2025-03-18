require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "isort", "black" },
		javascript = { "prettierd", "rustywind" },
		javascriptreact = { "prettierd", "rustywind" },
		typescript = { "prettierd", "rustywind" },
		typescriptreact = { "prettierd", "rustywind" },
		json = { "prettierd" },
		rust = { "rustfmt" },
		html = { "prettierd", "djlint", "rustywind" },
		css = { "prettierd" },
		scss = { "prettierd" },
		markdown = { "prettierd" },
		yaml = { "prettierd" },
		svelte = { "prettierd" },
		go = { "gofmt" },
	},
})

require("conform").formatters.prettierd = {
	prepend_args = { "--tab-width", "4" },
	-- The base args a
	-- re { "-filename", "$FILENAME" } so the final args will be
	-- { "-i", "2", "-filename", "$FILENAME" }
}

vim.keymap.set("n", "<leader>f", function()
	require("conform").format()
end)

-- Map <leader>F to :FormatWrite
--vim.api.nvim_set_keymap("n", "<leader>F", ":FormatWriteLock<CR>", { noremap = true, silent = true })

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
