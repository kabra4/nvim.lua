local lsp_zero = require("lsp-zero")
local nvim_lsp = require("lspconfig")

nvim_lsp["htmx"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "html", "typescriptreact", "javascriptreact", "jinja" },
})
--local util = require("lspconfig/util")

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>va", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	--vim.keymap.set("i", "<C-h>", function()
		--vim.lsp.buf.signature_help()
	--end, opts)
	vim.keymap.set("n", "gi", function()
		vim.lsp.buf.implementation()
	end, opts)
	vim.keymap.set("n", "gr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "gD", function()
		vim.lsp.buf.declaration()
	end, opts)
	vim.keymap.set("n", "<leader>vv", vim.cmd.LspRestart)
end)

lsp_zero.set_sign_icons({
	error = "✘",
	warn = "▲",
	hint = "⚑",
	info = "»",
})

--local has_words_before = function()
--if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
--return false
--end
--local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
--end

--local configs = require("lspconfig.configs")
--if not configs.jinja_lsp then
--configs.jinja_lsp = {
--default_config = {
--cmd = { vim.fn.stdpath("data") .. "/mason/bin/jinja-lsp" },

--filetypes = { "html", "jinja", "rs", "css" },
--root_dir = function(fname)
--return "."
--end,
--settings = {
--templates = "./templates",
--backend = { "./src" },
--lang = "rust",
--},
--},
--}
--end

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"html",
		"htmx",
		"pyright",
		"tailwindcss",
		"gopls",
	},
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
		lsp_zero.default_setup,
	},
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	sources = {
		{ name = "path" },
		{ name = "buffer" },
		{ name = "nvim_lsp" },
		--{ name = "copilot" },
		--{ name = "crates" },
		{ name = "nvim_lua" },
	},
	preselect = "item",
	completion = {
		completeopt = "menu,menuone,noinsert",
	},
	formatting = lsp_zero.cmp_format(),

	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping.confirm({ select = true }),
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-Space>"] = cmp.mapping.complete(),
		--[[['<C-/>'] = cmp.mapping.confirm({ select = true }),]]
	}),
})

vim.diagnostic.config({
	virtual_text = true,
})
