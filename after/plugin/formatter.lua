local util = require("formatter.util")
--local prettierd = function()
--return {
--exe = "prettierd",
--args = { vim.api.nvim_buf_get_name(0), "--tab-width 4" },
--stdin = true,
--}
--end
require("formatter").setup({
	logging = true,
	filetype = {
		--javascript = { prettierd },
		--typescript = { prettierd },
		--typescriptreact = { prettierd },
		--javascriptreact = { prettierd },
		--json = { prettierd },
		--html = { prettierd },
		--css = { prettierd },
		--scss = { prettierd },
		--markdown = { prettierd },
		--yaml = { prettierd },
		--svelte = { prettierd },
        typescript = {
            require("formatter.filetypes.typescript").prettierd
        },
        typescriptreact = {
            require("formatter.filetypes.typescriptreact").prettierd
        },
        javascript = {
            require("formatter.filetypes.javascript").prettierd
        },
        javascriptreact = {
            require("formatter.filetypes.javascriptreact").prettierd
        },
        json = {
            require("formatter.filetypes.json").prettierd
        },
        html = {
            require("formatter.filetypes.html").prettierd
        },
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
        python = {
            require("formatter.filetypes.python").black
        }
	},
})

-- Map <leader>f to :Format
vim.api.nvim_set_keymap("n", "<leader>f", ":Format<CR>", { noremap = true, silent = true })

-- Map <leader>F to :FormatWrite
vim.api.nvim_set_keymap("n", "<leader>F", ":FormatWrite<CR>", { noremap = true, silent = true })
