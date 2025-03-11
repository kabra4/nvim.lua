require("auto-save").setup({
	enabled = true,

	trigger_events = { -- See :h events
		immediate_save = { "BufLeave", "FocusLost" }, -- vim events that trigger an immediate save

		defer_save = { "InsertLeave", "TextChanged" },
		cancel_deferred_save = { "InsertEnter" }, -- vim events that cancel a pending deferred save
	},
	-- function that determines whether to save the current buffer or not
	-- return true: if buffer is ok to be saved
	-- return false: if it's not ok to be saved
	condition = function(buf)
		if vim.bo.ft == "harpoon" then
			return false
		end
		local fn = vim.fn
		local utils = require("auto-save.utils.data")

		if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
			return true -- met condition(s), can save
		end
		return false -- can't save
	end,

	debounce_delay = 3000,

	debug = true,
})
