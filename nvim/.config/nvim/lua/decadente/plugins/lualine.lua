return {
	"nvim-lualine/lualine.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local colors = require("catppuccin.palettes").get_palette("mocha")
		local function make_theme(color)
			return {
				a = { bg = colors.mantle, fg = color, gui = "bold" },
				b = { bg = colors.mantle, fg = color },
				c = { bg = colors.mantle, fg = colors.text },
				y = { bg = colors.mantle, fg = colors.subtext0 },
				z = { bg = colors.mantle, fg = colors.subtext0 },
			}
		end
		local theme = {
			normal = make_theme(colors.blue),
			insert = make_theme(colors.green),
			visual = make_theme(colors.mauve),
			replace = make_theme(colors.red),
			command = make_theme(colors.peach),
			inactive = {
				a = { bg = colors.mantle, fg = colors.overlay2, gui = "bold" },
				b = { bg = colors.mantle, fg = colors.overlay2 },
				c = { bg = colors.mantle, fg = colors.overlay2 },
				x = { bg = colors.mantle, fg = colors.overlay2 },
				z = { bg = colors.mantle, fg = colors.overlay2 },
			},
		}
		require("lualine").setup({
			options = {
				theme = theme,
				component_separators = "",
				section_separators = "",
				icons_enabled = true,
				globalstatus = true,
				ignore_focus = {
					"Trouble",
					"NvimTree",
				},
			},
			sections = {
				lualine_b = { "" },
				lualine_c = {
					{ "filename", path = 1, symbols = { modified = "", readonly = "" }, padding = 0 },
				},
				lualine_x = { "diagnostics" },
				lualine_y = { "branch", "diff" },
				lualine_z = {
					{ "progress", padding = 1 },
					{ "location", padding = 0 },
				},
			},
		})
	end,
}
