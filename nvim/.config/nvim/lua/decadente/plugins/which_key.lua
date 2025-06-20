return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		delay = 0,
		win = {
			height = { min = 4, max = 12 },
		},
		spec = {
			{ "<leader>1", icon = "󰛢" },
			{ "<leader>2", icon = "󰛢" },
			{ "<leader>3", icon = "󰛢" },
			{ "<leader>4", icon = "󰛢" },
			{ "<leader>a", icon = "󰛢" },
			{ "<leader><leader>", icon = "󰛢" },
			{ "<leader>f", group = "[F]ormat", icon = "" },
			{ "<leader>s", group = "[S]earch", icon = "" },
			{ "<leader>t", group = "[T]rouble", icon = "" },
			{ "<leader>g", group = "[G]it", mode = { "n", "v" }, icon = "" },
		},
		triggers = {
			{ "<auto>", mode = "nixsotc" },
			{ "a", mode = { "n", "v" } },
		},
	},
}
