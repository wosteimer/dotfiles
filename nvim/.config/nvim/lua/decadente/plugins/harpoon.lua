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
			desc = "[A]dd file to harpoon list",
		},
		{
			"<leader><leader>",
			function()
				require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
			end,
			mode = "n",
			desc = "Toggle harpoon menu",
		},
		{
			"<leader>1",
			function()
				require("harpoon"):list():select(1)
			end,
			mode = "n",
			desc = "Go to file[1]",
		},
		{
			"<leader>2",
			function()
				require("harpoon"):list():select(2)
			end,
			mode = "n",
			desc = "Go to file[2]",
		},
		{
			"<leader>3",
			function()
				require("harpoon"):list():select(3)
			end,
			mode = "n",
			desc = "Go to file[3]",
		},
		{
			"<leader>4",
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
