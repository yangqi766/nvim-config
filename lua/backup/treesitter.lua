local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	-- ensure_installed = {
	--		'bash', 'c', 'clojure', 'cmake', 'comment', 'commonlisp',
	--		'cpp', 'css', 'dart', 'dockerfile', 'dot', 'fennel', 'fish',
	--		'go', 'gomod', 'gowork', 'graphql', 'hack', 'haskell', 'hcl',
	--		'help', 'html', 'http', 'java', 'javascript', 'jsdoc', 'json',
	--		'json5', 'jsonc', 'julia', 'kotlin', 'latex', 'llvm', 'lua',
	--		'make', 'markdown', 'ninja', 'nix', 'norg', 'perl', 'php',
	--		'pug', 'python', 'query', 'r', 'regex', 'rst', 'ruby', 'rust',
	--		'scala', 'scheme', 'scss', 'svelte', 'todotxt', 'toml', 'tsx',
	--		'typescript', 'vala', 'vim', 'vue', 'yaml', 'zig',
	--	},
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	ignore_install = { "" }, -- List of parsers to ignore installing
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<CR>",
			node_decremental = "<BS>",
			scope_incremental = "<TAB>",
		},
	},
	indent = { enable = true, disable = { "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
