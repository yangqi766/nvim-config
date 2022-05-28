local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_respect_buf_cwd = 1

vim.g.nvim_tree_git_hl = 0
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_create_in_closed_folder = 0

vim.g.nvim_tree_icon_padding = vim.g.global_symbol_padding or " "
vim.g.nvim_tree_special_files = {}
vim.g.nvim_tree_show_icons = {
	git = 0,
	folders = 1,
	files = 1,
	folder_arrows = 0,
}

vim.g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		unstaged = "",
		staged = "S",
		unmerged = "",
		renamed = "➜",
		deleted = "",
		untracked = "U",
		ignored = "◌",
	},
	folder = {
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
	},
}

local winwidth = 35

local toggle_width = function(_)
	local max = 0
	local line_count = vim.fn.line("$")

	for i = 1, line_count do
		local txt = vim.fn.substitute(vim.fn.getline(i), "\\s\\+$", "", "")
		max = math.max(vim.fn.strdisplaywidth(txt) + 2, max)
	end

	local cur_width = vim.fn.winwidth(0)
	local half = math.floor((winwidth + (max - winwidth) / 2) + 0.5)
	local new_width = winwidth
	if cur_width == winwidth then
		new_width = half
	elseif cur_width == half then
		new_width = max
	else
		new_width = winwidth
	end
	vim.cmd(new_width .. " wincmd |")
end

nvim_tree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {
		"startify",
		"dashboard",
		"alpha",
	},
	auto_close = true,
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = true,
	update_to_buf_dir = {
		enable = true,
		auto_open = true,
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	filters = {
		dotfiles = false,
		custom = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	view = {
		width = winwidth,
		height = 30,
		hide_root_folder = false,
		side = "left",
		auto_resize = true,
		mappings = {
			custom_only = false,
			list = {
				{ key = { "l" }, action = "edit", mode = "n" },
				{ key = "h", action = "close_node" },
				{ key = "C", action = "cd" },
				{ key = "v", action = "vsplit" },
				{ key = "sv", action = "split" },
				{ key = "n", action = "create" },
				{ key = "dd", action = "remove" },
				{ key = "r", action = "rename" },
				{ key = "x", action = "cut" },
				{ key = "c", action = "copy" },
				{ key = "p", action = "paste" },
				{ key = "w", action = "toggle_width", action_cb = toggle_width },
			},
		},
		number = false,
		relativenumber = false,
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	quit_on_open = 0,
	git_hl = 1,
	disable_window_picker = 0,
	root_folder_modifier = ":t",
	show_icons = {
		git = 1,
		folders = 1,
		files = 1,
		folder_arrows = 1,
		tree_width = 30,
	},
})
