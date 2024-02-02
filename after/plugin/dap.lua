local dap, dapui = require("dap"), require("dapui")
dapui.setup()

vim.keymap.set("n", "<leader>dt", function()
	dapui.toggle()
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>dc", function()
	dap.continue()
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>ds", function()
	dap.step_over()
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>di", function()
	dap.step_into()
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>dbp", function()
	dap.toggle_breakpoint()
end, { noremap = true, silent = true })

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end
