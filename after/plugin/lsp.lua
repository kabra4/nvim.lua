-- Set sign column so that the layout won’t jump when diagnostics appear
vim.opt.signcolumn = "yes"

-- Add borders to hover and signatureHelp floating windows
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

local lsp = require("lsp-zero")

-- Ensure these LSP servers are installed (Mason will take care of it).
--lsp.ensure_installed({
--"html",
--"htmx",
--"pyright",
--"tailwindcss",
--"gopls",
--"ts_ls",
--})

-- Setup Mason and mason-lspconfig.
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"html",
		"pyright",
		"tailwindcss",
		"lua_ls",
		"gopls",
		"ts_ls",
	},
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
	},
})

-- (Optional) If you need to configure custom settings with lspconfig,
-- you can grab the default cmp capabilities early:
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")

-- Example: Configure the htmx language server with extra filetypes.
--lspconfig.htmx.setup({
--capabilities = capabilities,
--filetypes = { "html", "typescriptreact", "javascriptreact", "jinja" },
--})

-- Configure lua_ls (Neovim Lua) using lsp-zero’s helper.
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

-- Global LspAttach autocmd to define keymaps once an LSP client attaches.
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		local opts = { buffer = event.buf }
		-- The migration docs suggest these bindings:
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, opts)
		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set("n", "gD", function()
			vim.lsp.buf.declaration()
		end, opts)
		vim.keymap.set("n", "gi", function()
			vim.lsp.buf.implementation()
		end, opts)
		vim.keymap.set("n", "go", function()
			vim.lsp.buf.type_definition()
		end, opts)
		vim.keymap.set("n", "gr", function()
			require("telescope.builtin").lsp_references()
			--vim.lsp.buf.references()
		end, opts)
		vim.keymap.set("n", "gs", function()
			vim.lsp.buf.signature_help()
		end, opts)

		-- Additional keybindings (as in the migration docs)
		vim.keymap.set("n", "<F2>", function()
			vim.lsp.buf.rename()
		end, opts)
		vim.keymap.set({ "n", "x" }, "<F3>", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
		vim.keymap.set("n", "<F4>", function()
			vim.lsp.buf.code_action()
		end, opts)

		-- You can add any extra mappings here (for instance, workspace symbols,
		-- diagnostic floating windows, etc.) that you used in your v3 config.
		vim.keymap.set("n", "<leader>vv", vim.cmd.LspRestart, opts)
	end,
})

-- Customize diagnostic display
vim.diagnostic.config({
	virtual_text = true,
})

-- Optionally set custom signs for diagnostics
lsp.set_sign_icons({
	error = "✘",
	warn = "▲",
	hint = "⚑",
	info = "»",
})

-- Setup nvim-cmp for autocompletion and snippet expansion.
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local has_words_before = function()
	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
		return false
	end
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	if col == 0 then
		return false
	end
	local text = vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]
	return text:match("^%s*$") == nil
end

cmp.setup({
	sources = {
		{ name = "path" },
		{ name = "buffer" },
		{ name = "nvim_lsp" },
		{ name = "copilot" },
		{ name = "nvim_lua" },
	},
	completion = {
		completeopt = "menu,preview,menuone,noinsert,noselect",
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	formatting = lsp.cmp_format(),
	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
	}),
	sorting = {
		priority_weight = 2,
		comparators = {
			require("copilot_cmp.comparators").prioritize,
		},
	},
})

-- (Optional) Setup mason-conform if you’re using it
require("mason-conform").setup()

-- Finalize lsp-zero’s setup
lsp.setup()
