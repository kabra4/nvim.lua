local harpoon = require("harpoon")

-- REQUIRED
harpoon.setup()
-- REQUIRED
-- basic telescope configuration
--local conf = require("telescope.config").values
--local function toggle_telescope(harpoon_files)
	--local file_paths = {}
	--for _, item in ipairs(harpoon_files.items) do
		--table.insert(file_paths, item.value)
	--end

	--require("telescope.pickers")
		--.new({}, {
			--prompt_title = "Harpoon",
			--finder = require("telescope.finders").new_table({
				--results = file_paths,
			--}),
			--previewer = conf.file_previewer({}),
			--sorter = conf.generic_sorter({}),
		--})
		--:find()
--end

--vim.keymap.set("n", "<C-e>", function()
--toggle_telescope(harpoon:list())
--end, { desc = "Open harpoon window" })
marks = require("harpoon.mark")
ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", function()
	marks.add_file()
end)
vim.keymap.set("n", "<C-e>", function()
	ui.toggle_quick_menu()
end)

vim.keymap.set("n", "<C-h>", function()
	ui.nav_file(1)
end)
vim.keymap.set("n", "<C-t>", function()
	ui.nav_file(2)
end)
vim.keymap.set("n", "<C-n>", function()
	ui.nav_file(3)
end)

vim.keymap.set("n", "<C-s>", function()
	ui.nav_file(4)
end)

--vim.api.nvim_create_autocmd({ "TextChanged", "InsertLeave" }, {
--pattern = { "*" },
--command = "silent! wall",
--nested = true,
--})
