local status_ok, acceleratedjk = pcall(require, "accelerated-jk")
if not status_ok then
	return
end
acceleratedjk.setup({
	mode = "time_driven",
	enable_deceleration = false,
	acceleration_limit = 150,
	acceleration_table = { 3, 5, 10, 15, 30, 40 },
	-- when 'enable_deceleration = true', 'deceleration_table = { {200, 3}, {300, 7}, {450, 11}, {600, 15}, {750, 21}, {900, 9999} }'
	deceleration_table = { { 200, 9999 } },
})
