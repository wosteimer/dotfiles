-- vim.opt.mouse = ""

vim.opt.clipboard = "unnamedplus"
vim.opt.guicursor = ""
vim.opt.conceallevel = 2
vim.opt.colorcolumn = "110"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = false
vim.opt.wrap = false
vim.opt.linebreak = true

vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.completeopt = "menu,menuone,noinsert"

vim.opt.termguicolors = true
vim.opt.showmode = false

vim.opt.spell = false
vim.opt.spelllang = { "pt_br", "en_us" }

vim.opt.swapfile = false

vim.wo.cursorline = true

vim.cmd.packadd("nvim.undotree")

-- Auto enable spell checking in markdown files
local spell_group = vim.api.nvim_create_augroup("spell", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*.md" },
	group = spell_group,
	callback = function()
		vim.opt_local.wrap = true
		vim.o.colorcolumn = "0"
		vim.opt_local.spell = true
	end,
})
-- Highlight when yanking text
local yank_highlight_group = vim.api.nvim_create_augroup("highlight-yank", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = yank_highlight_group,
	callback = function()
		vim.hl.on_yank()
	end,
})

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.foldnestmax = 3
vim.opt.foldminlines = 8
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.statuscolumn = "%@v:lua.ToggleBreakpoint@%s%l%#LineNr#%@v:lua.ToggleFold@%{v:lua.Foldcolumn()}%T"
vim.opt.foldtext = "v:lua.Foldtext()"
vim.opt.fillchars = { fold = " " }

---@param lnum integer
---@param col integer
---@return string?
local function get_highlight_at_pos(lnum, col)
	local tokens = vim.lsp.semantic_tokens.get_at_pos(0, lnum - 1, col - 1)
	if tokens ~= nil and #tokens > 0 then
		local name = "@lsp.type." .. tokens[#tokens].type
		if not vim.tbl_isempty(vim.api.nvim_get_hl(0, { name = name })) then
			return name
		end
	end
	local captures = vim.treesitter.get_captures_at_pos(0, lnum - 1, col - 1)
	if #captures > 0 then
		return "@" .. captures[#captures].capture
	end
end

---@param lnum integer
---@return { [1]: string, [2]: string }[]
local function get_highlights(lnum)
	local text = ""
	local line = vim.fn.getline(lnum)
	local current = nil
	local result = {}
	for col = vim.fn.winsaveview().leftcol + 1, line:len() do
		local highlight = get_highlight_at_pos(lnum, col)
		if highlight ~= current then
			table.insert(result, { text, current })
			text = line:sub(col, col)
			current = highlight
		else
			text = text .. line:sub(col, col)
		end
	end
	table.insert(result, { text, current })
	return result
end

function Foldtext()
	local highlights = get_highlights(vim.v.foldstart)
	table.insert(highlights, { " 󰇘", "@comment" })
	return highlights
end

function Foldcolumn()
	local expr = tostring(vim.treesitter.foldexpr(vim.v.lnum))
	if expr:sub(1, 1) == ">" then
		if vim.fn.foldclosed(vim.v.lnum) == -1 then
			return " "
		else
			return " "
		end
	end
	return string.rep(" ", vim.fn.strdisplaywidth(" "))
end

function ToggleFold()
	local line = vim.fn.getmousepos().line
	local expr = tostring(vim.treesitter.foldexpr(line))
	if expr:sub(1, 1) ~= ">" then
		return
	end
	vim.api.nvim_win_set_cursor(0, { line, 1 })
	local foldclosed = vim.fn.foldclosed(line)
	if foldclosed ~= -1 then
		vim.cmd("foldopen")
	else
		vim.cmd("foldclose")
	end
end

function ToggleBreakpoint()
	vim.cmd("DapToggleBreakpoint")
end
