return {
	{
		"echasnovski/mini.ai",
		version = false,
		opts = {},
	},
	{
		"echasnovski/mini.surround",
		version = false,
		config = function()
			vim.keymap.set("", "s", "<nop>")
			require("mini.surround").setup()
		end,
	},
}
