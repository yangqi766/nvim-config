local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")

local defaults = {
	prompt_prefix = " ",
	selection_caret = " ",
	path_display = { "smart" },
	entry_prefix = "  ",
	initial_mode = "insert",
	selection_strategy = "reset",
	sorting_strategy = "descending",
	layout_strategy = "horizontal",
	layout_config = {
		width = 0.75,
		preview_cutoff = 120,
		horizontal = {
			preview_width = function(_, cols, _)
				if cols < 120 then
					return math.floor(cols * 0.5)
				end
				return math.floor(cols * 0.6)
			end,
			mirror = false,
		},
		vertical = { mirror = false },
	},
	vimgrep_arguments = {
		"rg",
		"--color=never",
		"--no-heading",
		"--with-filename",
		"--line-number",
		"--column",
		"--smart-case",
		"--hidden",
		"--glob=!.git/",
	},

	mappings = {
		i = {
			["<C-j>"] = actions.cycle_history_next,
			["<C-k>"] = actions.cycle_history_prev,

			["<C-n>"] = actions.move_selection_next,
			["<C-p>"] = actions.move_selection_previous,

			["<C-c>"] = actions.close,

			["<Down>"] = actions.move_selection_next,
			["<Up>"] = actions.move_selection_previous,

			["<CR>"] = actions.select_default,
			["<C-x>"] = actions.select_horizontal,
			["<C-v>"] = actions.select_vertical,
			["<C-t>"] = actions.select_tab,

			["<C-u>"] = actions.preview_scrolling_up,
			["<C-d>"] = actions.preview_scrolling_down,

			["<PageUp>"] = actions.results_scrolling_up,
			["<PageDown>"] = actions.results_scrolling_down,

			["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
			["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
			["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
			["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			["<C-l>"] = actions.complete_tag,
			["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
		},

		n = {
			["<esc>"] = actions.close,
			["<CR>"] = actions.select_default,
			["<C-x>"] = actions.select_horizontal,
			["<C-v>"] = actions.select_vertical,
			["<C-t>"] = actions.select_tab,

			["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
			["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
			["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
			["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

			["j"] = actions.move_selection_next,
			["k"] = actions.move_selection_previous,
			["H"] = actions.move_to_top,
			["M"] = actions.move_to_middle,
			["L"] = actions.move_to_bottom,

			["<Down>"] = actions.move_selection_next,
			["<Up>"] = actions.move_selection_previous,
			["gg"] = actions.move_to_top,
			["G"] = actions.move_to_bottom,

			["<C-u>"] = actions.preview_scrolling_up,
			["<C-d>"] = actions.preview_scrolling_down,

			["<PageUp>"] = actions.results_scrolling_up,
			["<PageDown>"] = actions.results_scrolling_down,

			["?"] = actions.which_key,
		},
	},
}

telescope.setup({
	defaults = defaults,
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
	},
})
