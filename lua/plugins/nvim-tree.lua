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

local winwidth = 25

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

-- Get current opened directory from state.
-- local function get_current_directory(state)
-- 	local node = state.tree:get_node()
-- 	local path = node.path
-- 	if node.type ~= "directory" or not node:is_expanded() then
-- 		local path_separator = package.config:sub(1, 1)
-- 		path = path:match("(.*)" .. path_separator)
-- 	end
-- 	return path
-- end

local function start_telescope(telescope_mode)
	local node = require("nvim-tree.lib").get_node_at_cursor()
	local abspath = node.link_to or node.absolute_path
	local is_folder = node.open ~= nil
	local basedir = is_folder and abspath or vim.fn.fnamemodify(abspath, ":h")
	require("telescope.builtin")[telescope_mode]({
		cwd = basedir,
	})
end

local function telescope_find_files(_)
	start_telescope("find_files")
end
local function telescope_live_grep(_)
	start_telescope("live_grep")
end

nvim_tree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	open_on_setup_file = false,
	sort_by = "name",
	ignore_buffer_on_setup = false,
	ignore_ft_on_setup = {
		"startify",
		"dashboard",
		"alpha",
	},
	auto_reload_on_write = true,
	hijack_unnamed_buffer_when_opening = false,
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	auto_close = true,
	open_on_tab = true,
	hijack_cursor = false,
	update_cwd = false,
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
		dotfiles = true,
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
		hide_root_folder = true,
		side = "left",
		auto_resize = true,
		preserve_window_proportions = false,
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
				{ key = "c", action = "copy" },
				{ key = "x", action = "cut" },
				{ key = "p", action = "paste" },
				{ key = "w", action = "toggle_width", action_cb = toggle_width },
				{
					key = "gf",
					action = "telescope_find_files",
					action_cb = telescope_find_files,
				},
				{
					key = "gr",
					action = "telescope_live_grep",
					action_cb = telescope_live_grep,
				},
			},
		},
		number = false,
		relativenumber = false,
		signcolumn = "yes",
	},
	renderer = {
		indent_markers = {
			enable = true,
			icons = {
				corner = "└ ",
				edge = "│ ",
				none = "  ",
			},
		},
		icons = {
			glyphs = {
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
			},
		},
		highlight_git = true,
		root_folder_modifier = ":t",
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
		git = 0,
		folders = 1,
		files = 1,
		folder_arrows = 1,
		tree_width = 30,
	},
})
