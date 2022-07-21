local options = {
	backup = false, -- creates a backup file
	clipboard = "unnamedplus", -- allows neovim to access the system clipboard
	completeopt = { "menuone", "noselect" },
	conceallevel = 0, -- so that `` is visible in markdown files
	fileencoding = "utf-8", -- the encoding written to a file
	foldmethod = "manual", -- folding, set to "expr" for treesitter based folding
	foldexpr = "", -- set to "nvim_treesitter#foldexpr()" for treesitter based folding
	guifont = "monospace:h17", -- the font used in graphical neovim applications
	hidden = true, -- required to keep multiple buffers and open multiple buffers
	hlsearch = true, -- highlight all matches on previous search pattern
	ignorecase = true, -- ignore case in search patterns
	mouse = "nv", -- allow the mouse to be used in neovim
	pumheight = 10, -- pop up menu height
	showmode = false, -- we don't need to see things like -- INSERT -- anymore
	smartcase = true, -- smart case
	smartindent = true, -- make indenting smarter again
	splitbelow = true, -- force all horizontal splits to go below current window
	splitright = true, -- force all vertical splits to go to the right of current window
	swapfile = false, -- creates a swapfile
	termguicolors = true, -- set term gui colors (most terminals support this)
	timeoutlen = 250, -- time to wait for a mapped sequence to complete (in milliseconds)
	title = true, -- set the title of window to the value of the titlestring
	undofile = true, -- enable persistent undo
	updatetime = 300, -- faster completion
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 1, -- the number of spaces inserted for each indentation
	tabstop = 2, -- insert 2 spaces for a tab
	cursorline = true, -- highlight the current line
	number = false, -- set numbered lines
	relativenumber = false, -- set relative numbered lines
	numberwidth = 1, -- set number column width to 2 {default 4}
	signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
	-- wrap = false, -- display lines as one long line
	-- foldmethod = "expr",
	-- open fold
	-- foldexpr = "nvim_treesitter#foldexpr()",
	foldlevel = 99,
	-- Editor UI
	shortmess = "aoOTI", -- Shorten messages and don't show intro
	scrolloff = 2, -- Keep at least 2 lines above/below
	sidescrolloff = 5, -- Keep at least 5 lines left/right
	showtabline = 2, -- Always show the tabs line
	helpheight = 0, -- Disable help window resizing
	winwidth = 25, -- Minimum width for active window
	winminwidth = 1, -- Minimum width for inactive windows
	winheight = 1, -- Minimum height for active window
	winminheight = 1, -- Minimum height for inactive window
	cmdheight = 1, -- Height of the command line
	cmdwinheight = 5, -- Command-line lines
	laststatus = 2, -- Always show a status line
	colorcolumn = "+0", -- Column highlight at textwidth's max character-limit
	textwidth = 80, -- Text width maximum chars before wrapping
	display = "lastline",
}

---  SETTINGS  ---
vim.opt.whichwrap:append("<,>,[,],h,l")

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- vim.cmd("set whichwrap+=<,>,[,],h,l") -- jump to next or above line
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set noshowmode]]) -- Don't show mode in cmd window
vim.cmd([[set noshowcmd]]) -- Don't show command in status line

vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work
