local which_key = require("which-key")

-- Setting up which-key descriptions for LSP keybindings
which_key.add({
	--{ "<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Signature help in insert mode" },
	{ "<leader>vca", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code action" },
	{ "<leader>vd", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Open diagnostic float" },
	{ "<leader>vrn", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename symbol" },
	{ "<leader>vrr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "List references" },
	{ "<leader>vv", "<cmd>LspRestart<CR>", desc = "Restart LSP" },
	{ "<leader>vws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", desc = "Search workspace symbols" },
	{ "K", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Show hover information" },
	{ "[d", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next diagnostic" },
	{ "]d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", desc = "Previous diagnostic" },
	{ "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", desc = "Go to declaration" },
	{ "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", desc = "Go to definition" },
	{ "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", desc = "Go to implementation" },
	{ "gr", "<cmd>lua vim.lsp.buf.references()<CR>", desc = "List references" },
}) -- Normal mode keybindings


-- Additional configuration options for which-key
which_key.setup({
	plugins = {
		spelling = {
			enabled = true,
			suggestions = 20,
		},
	},
	operators = {
		gc = "Comments",
	},
	icons = {
		breadcrumb = "»", -- This is just an example; adjust according to your preference
		separator = "➜", -- Example separator
		group = "+", -- Example group icon
	},
	window = {
		border = "single", -- Choose the border style, e.g., "rounded", "single", "double", etc.
		position = "bottom", -- Position can be "bottom", "top", etc.
		margin = { 1, 0, 1, 0 }, -- Margins for the window {top, right, bottom, left}
		padding = { 2, 2, 2, 2 }, -- Padding for the window {top, right, bottom, left}
	},
	layout = {
		height = { min = 4, max = 25 }, -- Min and max height for the popup
		width = { min = 20, max = 50 }, -- Min and max width for the popup
		spacing = 3, -- Spacing between columns
		align = "left", -- Align columns to the left
	},
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "<C-r>", "<C-space>", "<Tab>" },
	show_help = true, -- Show help message on the command line
	triggers_blacklist = {
		-- List of mode/maps you don't want which-key to handle
		i = { "j", "k" },
		v = { "j", "k" },
	},
})
