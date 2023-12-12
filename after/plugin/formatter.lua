local util = require("formatter.util")
local prettierd = function()
	return {
		exe = "prettierd",
		args = { util.escape_path(util.get_current_buffer_file_path()) },
		stdin = true,
	}
end
require("formatter").setup({
	logging = false,
	filetype = {
		javascript = { prettierd },
		typescript = { prettierd },
		typescriptreact = { prettierd },
		javascriptreact = { prettierd },
		json = { prettierd },
		html = { prettierd },
		css = { prettierd },
		scss = { prettierd },
		markdown = { prettierd },
		yaml = { prettierd },
		lua = {
			-- luafmt
			function()
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},
	},
})

-- Map <leader>f to :Format
vim.api.nvim_set_keymap("n", "<leader>f", ":Format<CR>", { noremap = true, silent = true })

-- Map <leader>F to :FormatWrite
vim.api.nvim_set_keymap("n", "<leader>F", ":FormatWrite<CR>", { noremap = true, silent = true })
