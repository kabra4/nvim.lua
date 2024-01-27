local tsnode = require("ts-node-action").setup({})

vim.keymap.set({ "n" }, "Q", require("ts-node-action").node_action, { desc = "Trigger Node Action" })
