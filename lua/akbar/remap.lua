vim.g.mapleader = " "
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>c/", "I//<Esc>")
vim.keymap.set("n", "<leader>c#", "I#<Esc>")

vim.keymap.set("n", "<leader>vwm", function()
	require("vim-with-me").StartVimWithMe()
end)
--vim.keymap.set("n", "<leader>svwm", function()
--require("vim-with-me").StopVimWithMe()
--end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste over without yanking" })

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set(
	"n",
	"<leader>rwg",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word globally " }
)
vim.keymap.set(
	"n",
	"<leader>rwc",
	[[:.,$s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Replace word to end " }
)
vim.keymap.set(
	"n",
	"<leader>rWg",
	[[:%s/\<<C-r><C-a>\>/<C-r><C-a>/gI<Left><Left><Left>]],
	{ desc = "Replace WORD globally " }
)
vim.keymap.set(
	"n",
	"<leader>rWc",
	[[:.,$s/\<<C-r><C-a>\>/<C-r><C-a>/gI<Left><Left><Left>]],
	{ desc = "Replace WORD to end " }
)
vim.keymap.set(
	"n",
	"<leader>rwag",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]],
	{ desc = "Replace word globally  with confirm" }
)
vim.keymap.set(
	"n",
	"<leader>rwac",
	[[:.,$s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]],
	{ desc = "Replace word to end  with confirm" }
)
vim.keymap.set(
	"n",
	"<leader>rWag",
	[[:%s/\<<C-r><C-a>\>/<C-r><C-a>/gIc<Left><Left><Left><Left>]],
	{ desc = "Replace WORD globally with confirm" }
)
vim.keymap.set(
	"n",
	"<leader>rWac",
	[[:.,$s/\<<C-r><C-a>\>/<C-r><C-a>/gIc<Left><Left><Left><Left>]],
	{ desc = "Replace WORD to end  with confirm" }
)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

vim.keymap.set("n", "<leader><leader>", "<cmd>so<CR>")
vim.keymap.set("n", "<leader>w", "<cmd>wa<CR>")

vim.keymap.set("n", "<leader>nh", "<cmd>noh<CR>")
vim.api.nvim_set_keymap("i", "<C-s>", "<Del>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>sa", "ggVGzz", { noremap = true, silent = true })

-- fold inside {} and [] and ()
vim.api.nvim_set_keymap(
	"n",
	"<leader>zz",
	"$?\\%#[{}\\[\\]()]<CR>v%zf<leader>nh",
	{ noremap = true, silent = true, desc = "Fold nearest bracketed block" }
)
vim.api.nvim_set_keymap(
	"n",
	"<leader>zc",
	"va{zf",
	{ noremap = true, silent = true, desc = "Fold curly bracket block" }
)

vim.api.nvim_set_keymap("n", "<leader>zp", "va(zf", { noremap = true, silent = true, desc = "Fold parentheses block" })
vim.api.nvim_set_keymap(
	"n",
	"<leader>zs",
	"va[zf",
	{ noremap = true, silent = true, desc = "Fold square bracket block" }
)
vim.api.nvim_set_keymap("n", "<leader>zt", "vatzf", { noremap = true, silent = true, desc = "Fold tag block" })

vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
