-- lsp
local lsp_config_group = vim.api.nvim_create_augroup("lsp-config", { clear = true })
vim.api.nvim_create_autocmd("PackChanged", {
	group = lsp_config_group,
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "LuaSnip" and (kind == "install" or kind == "update") then
			vim.system({ "make", "install_jsregexp" }, { cwd = ev.data.path }):wait()
		end
		-- if name == "blink.cmp" and (kind == "install" or kind == "update") then
		-- 	vim.system({ "cargo", "build", "--release" }, { cwd = ev.data.path }):wait()
		-- end
		if name == "telescope-fzf-native.nvim" and (kind == "install" or kind == "update") then
			vim.system({ "make" }, { cwd = ev.data.path }):wait()
		end
	end,
})

-- treesitter
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
		local filetype = vim.bo.filetype
		local is_already_installed = vim.tbl_contains(ts_config.get_installed(), filetype)
		local is_available = vim.tbl_contains(ts_config.get_available(), filetype)
		if not is_already_installed and is_available then
			require("nvim-treesitter").install(filetype):await(init)
		elseif is_available or filetype == "typescriptreact" or filetype == "javascriptreact" then -- HACK: to work with tsx an jsx files
			init()
		end
	end,
})
