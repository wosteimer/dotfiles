return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	keys = {
		{
			"<leader>ha",
			function()
				require("harpoon"):list():add()
			end,
			mode = "n",
			desc = "[A]dd file",
		},
		{
			"<leader>ht",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
			mode = "n",
			desc = "[T]oggle menu",
		},
		{
			"<leader>h1",
			function()
				require("harpoon"):list():select(1)
			end,
			mode = "n",
			desc = "Go to file[1]",
		},
		{
			"<leader>h2",
			function()
				require("harpoon"):list():select(2)
			end,
			mode = "n",
			desc = "Go to file[2]",
		},
		{
			"<leader>h3",
			function()
				require("harpoon"):list():select(3)
			end,
			mode = "n",
			desc = "Go to file[3]",
		},
		{
			"<leader>h4",
			function()
				require("harpoon"):list():select(4)
			end,
			mode = "n",
			desc = "Go to file[4]",
		},

		-- Toggle previous & next buffers stored within require("Harpoon") list
		{
			"[h",
			function()
				require("harpoon"):list():prev({ ui_nav_wrap = true })
			end,
			mode = "n",
			desc = "jump to previous harpoon file",
		},
		{
			"]h",
			function()
				require("harpoon"):list():next({ ui_nav_wrap = true })
			end,
			mode = "n",
			desc = "jump to next harpoon file",
		},
	},
}
