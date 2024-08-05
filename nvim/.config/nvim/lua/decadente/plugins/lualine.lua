return {
    "nvim-lualine/lualine.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("lualine").setup({
            options = {
                theme = "catppuccin",
                component_separators = " ",
                section_separators = " ",
                icons_enabled = true,
                globalstatus = true,
                ignore_focus = {
                    "Trouble",
                    "NvimTree",
                },
            },
        })
    end,
}
