M = {}

function M:init()
	require("config.autocmd")
	require("config.color")
	require("config.keymaps")
	require("config.options")
	require("config.plugins")
end

return M
