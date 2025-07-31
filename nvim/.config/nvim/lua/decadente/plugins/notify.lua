return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		notify.setup({
			merge_duplicates = true,
			fps = 60,
		})
		vim.notify = notify
	end,
}
