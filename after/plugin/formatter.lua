--local util = require("formatter.util")
--local prettierd = function()
--return {
--exe = "prettierd",
--args = { vim.api.nvim_buf_get_name(0), "--tab-width 4" },
--stdin = true,
--}
--end
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- Conform will run multiple formatters sequentially
		python = { "isort", "black" },
		-- Use a sub-list to run only the first available formatter
		javascript = { { "prettierd", "prettier" }, "rustywind" },
		typescript = { { "prettierd", "prettier" }, "rustywind" },
		json = { { "prettierd", "prettier" } },
		rust = { "rustfmt" },
		html = { "prettierd", "djlint", "rustywind" },
		css = { "prettierd" },
		scss = { "prettierd" },
		markdown = { "prettierd" },
		yaml = { "prettierd" },
		svelte = { "prettierd" },
	},
})
--require("formatter").setup({
--logging = true,
--filetype = {
----javascript = { prettierd },
----typescript = { prettierd },
----typescriptreact = { prettierd },
----javascriptreact = { prettierd },
----json = { prettierd },
----html = { prettierd },
----css = { prettierd },
----scss = { prettierd },
----markdown = { prettierd },
----yaml = { prettierd },
----svelte = { prettierd },
--typescript = {
--require("formatter.filetypes.typescript").prettierd,
--},
--typescriptreact = {
--require("formatter.filetypes.typescriptreact").prettierd,
--},
--javascript = {
--require("formatter.filetypes.javascript").prettierd,
--},
--javascriptreact = {
--require("formatter.filetypes.javascriptreact").prettierd,
--},
--svelte = {
--require("formatter.filetypes.typescript").prettierd,
--},
--prisma = {
--function()
--return {
--exe = "prettierd",
--args = {
--"--stdin-filepath",
--vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
--"--use-tabs",
--"--tab-width",
--"4",
--"--plugin=prettier-plugin-prisma",
--},
--stdin = true,
--}
--end,
--},
--json = {
--require("formatter.filetypes.json").prettierd,
--},
--html = {
----require("formatter.filetypes.html").htmlbeautifier,
--function()
--return {
--exe = "htmlbeautifier",
--stdin = true,
---- indent 4
--args = {
--"-i",
--"4",
--},
--}
--end,
--},
--lua = {
---- luafmt
--function()
--return {
--exe = "stylua",
--args = {
--"--search-parent-directories",
--"--stdin-filepath",
--util.escape_path(util.get_current_buffer_file_path()),
--"--",
--"-",
--},
--stdin = true,
--}
--end,
--},
--python = {
--require("formatter.filetypes.python").black,
--},
--rust = {
--require("formatter.filetypes.rust").rustfmt,
--},
--astro = {
--function()
--return {
--exe = "prettier",
--args = {
--"--stdin-filepath",
--vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
--"--use-tabs",
--"--tab-width",
--"4",
--"--plugin=prettier-plugin-astro",
--},
--stdin = true,
--}
--end,
--},
--["*"] = {
--require("formatter.filetypes.any").remove_trailing_whitespace,
--},
--},
--})

-- Map <leader>f to :Format
--vim.api.nvim_set_keymap("n", "<leader>f", ":FormatLock<CR>", { noremap = true, silent = true })

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
