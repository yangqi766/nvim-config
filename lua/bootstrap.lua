local M = {}

function _G.get_runtime_dir()
	local vim_runtime_dir = os.getenv("RUNTIME_DIR")
	return vim_runtime_dir
end

function _G.load_plugins()
	require("plugins.cmp")
	require("plugins.telescope")
	require("plugins.treesitter")
	require("plugins.autopairs")
	require("plugins.comment")
	require("plugins.gitsigns")
	require("plugins.nvim-tree")
	require("plugins.bufferline")
	require("plugins.lualines")
	require("plugins.toggleterm")
	require("plugins.project")
	require("plugins.impatient")
	require("plugins.indentline")
	require("plugins.alpha")
	require("plugins.whichkey")
	require("plugins.enhance")
end

function M:init()
	self.runtime_dir = get_runtime_dir()
	if self.runtime_dir then
		vim.opt.rtp:remove(vim.fn.stdpath("config"))
		vim.opt.rtp:append(self.runtime_dir)
	end
	require("config"):init()
	load_plugins()
	require("lsp")
end

return M
