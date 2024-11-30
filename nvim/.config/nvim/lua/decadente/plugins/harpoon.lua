return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	keys = {
		{
			"<leader>a",
			function()
				require("harpoon"):list():add()
			end,
			mode = "n",
		},
		{
			"<leader>e",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
			mode = "n",
		},

		{
			"<leader>1",
			function()
				require("harpoon"):list():select(1)
			end,
			mode = "n",
		},
		{
			"<leader>2",
			function()
				require("harpoon"):list():select(2)
			end,
			mode = "n",
		},
		{
			"<leader>3",
			function()
				require("harpoon"):list():select(3)
			end,
			mode = "n",
		},
		{
			"<leader>4",
			function()
				require("harpoon"):list():select(4)
			end,
			mode = "n",
		},

		-- Toggle previous & next buffers stored within require("Harpoon") list
		{
			"[h",
			function()
				require("harpoon"):list():prev({ ui_nav_wrap = true })
			end,
			mode = "n",
		},
		{
			"]h",
			function()
				require("harpoon"):list():next({ ui_nav_wrap = true })
			end,
			mode = "n",
		},
	},
}
