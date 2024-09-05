local powershell_options = {
	shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
	shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
	shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
	shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
	shellquote = "",
	shellxquote = "",
}
-- if system is windows then use powershell
if vim.fn.has("win32") == 1 then
	if vim.fn.executable("pwsh") == 1 then
		powershell_options.shell = "pwsh"
	else
		powershell_options.shell = "powershell"
	end

	for option, value in pairs(powershell_options) do
		vim.opt[option] = value
	end
end

require("toggleterm").setup({
	shell = vim.o.shell, -- Using the shell set in your earlier script
	direction = "horizontal",
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
	size = function(term)
		if term.direction == "horizontal" then
			return 30
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		elseif term.direction == "float" then
			return 15
		end
	end,
	open_mapping = [[<c-\>]],
	hide_numbers = true, -- hide the number column in toggleterm buffers
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
	start_in_insert = true,
	close_on_exit = true, -- close the terminal window when the process exits
})

--function _G.set_toggleterm_keymaps()
---- Horizontal terminal with Alt-h
--vim.api.nvim_set_keymap("n", "<leader>th", "<Cmd>ToggleTerm direction=horizontal<CR>", { noremap = true, silent = true })

---- Vertical terminal with Alt-v
--vim.api.nvim_set_keymap("n", "<leader>tv", "<Cmd>ToggleTerm direction=vertical<CR>", { noremap = true, silent = true })

---- Floating terminal with Alt-t
--vim.api.nvim_set_keymap("n", "<leader>tt", "<Cmd>ToggleTerm direction=float<CR>", { noremap = true, silent = true })

---- Toggle all terminals
--vim.api.nvim_set_keymap("n", "<leader>ta", "<Cmd>ToggleTermToggleAll<CR>", { noremap = true, silent = true })
--end

--set_toggleterm_keymaps()

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)

	-- open second vertical split terminal
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
