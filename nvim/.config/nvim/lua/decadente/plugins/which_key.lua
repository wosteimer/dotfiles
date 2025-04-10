return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		delay = 0,
		win = {
			height = { min = 4, max = 12 },
		},
		spec = {
			{ "<leader>z", group = "[Z]en mode", icon = "" },
			{ "<leader>l", group = "[L]sp", icon = "󱃖" },
			{ "<leader>lg", group = "[G]o to", icon = "󱃖" },
			{ "<leader>h", group = "[H]arpoon", icon = "󰛢" },
			{ "<leader>f", group = "[F]ind", icon = "" },
			{ "<leader>t", group = "[T]rouble", icon = "" },
			{ "<leader>g", group = "[G]it", mode = { "n", "v" }, icon = "" },
			{ "<leader>b", group = "[B]uffer ", mode = { "n", "v" }, icon = "" },
		},
		triggers = {
			{ "<leader>", mode = { "n", "v" } },
			--{ "s", mode = { "n", "v" } },
		},
	},
}
