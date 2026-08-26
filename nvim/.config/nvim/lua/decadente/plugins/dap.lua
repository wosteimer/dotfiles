require("nvim-dap-virtual-text").setup({})
local dap = require("dap")
local dapui = require("dapui")
dapui.setup()
dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	executable = {
		command = "codelldb",
		args = { "--port", "${port}" },
	},
}
dap.configurations.zig = {
	{
		name = "Launch",
		type = "codelldb",
		request = "launch",
		program = function()
			local cwd = vim.fn.getcwd()
			local bin_path = cwd .. "/zig-out/bin"

			---@diagnostic disable-next-line: undefined-field
			local handle = vim.loop.fs_scandir(bin_path)
			if not handle then
				print("Pasta zig-out/bin não encontrada")
				return nil
			end

			local files = {}
			while true do
				---@diagnostic disable-next-line: undefined-field
				local name, type = vim.loop.fs_scandir_next(handle)
				if not name then
					break
				end
				if type == "file" then
					table.insert(files, name)
				end
			end

			return coroutine.create(function(coro)
				vim.ui.select(files, {
					prompt = "Selecione o binário:",
				}, function(choice)
					if choice then
						coroutine.resume(coro, bin_path .. "/" .. choice)
					else
						coroutine.resume(coro, nil)
					end
				end)
			end)
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
	},
}
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end
vim.keymap.set("n", "<leader>dt", function()
	dapui.toggle()
end, { desc = "[T]oggle ui" })
vim.keymap.set("n", "<leader>dc", function()
	dap.continue()
end, { desc = "[C]ontinue" })
vim.keymap.set("n", "<leader>dO", function()
	dap.step_over()
end, { desc = "Step [O]ver" })
vim.keymap.set("n", "<leader>di", function()
	dap.step_into()
end, { desc = "Step [I]nto" })
vim.keymap.set("n", "<leader>do", function()
	dap.step_out()
end, { desc = "Step [O]ut" })
vim.keymap.set("n", "<leader>dj", function()
	dap.down()
end, { desc = "[J] Down" })
vim.keymap.set("n", "<leader>dk", function()
	dap.up()
end, { desc = "[k] Up" })
vim.keymap.set("n", "<Leader>db", function()
	dap.toggle_breakpoint()
end, { desc = "Toggle [B]reakpoint" })
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpointColor", linehl = "", numhl = "" })
