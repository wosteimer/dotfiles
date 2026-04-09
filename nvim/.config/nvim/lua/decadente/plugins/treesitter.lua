local treesitter_group = vim.api.nvim_create_augroup("treesitter", { clear = true })
vim.api.nvim_create_autocmd("PackChanged", {
	group = treesitter_group,
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and (kind == "install" or kind == "update") then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

local function init()
	pcall(vim.treesitter.start)
	vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
end

vim.api.nvim_create_autocmd("FileType", {
	group = treesitter_group,
	callback = function()
		local ts_config = require("nvim-treesitter.config")
		local already_installed = ts_config.get_installed()
		local availables = ts_config.get_available()
		local filetype = vim.bo.filetype
		local is_available = vim.tbl_contains(availables, filetype)
		if not vim.tbl_contains(already_installed, filetype) and is_available then
			require("nvim-treesitter").install(filetype):await(init)
		elseif is_available then
			init()
		end
	end,
})

vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})
