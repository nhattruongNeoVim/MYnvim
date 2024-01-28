return {
	{ "alec-gibson/nvim-tetris", cmd = "Tetris" },
	{ "ThePrimeagen/vim-be-good", cmd = "VimBeGood" },
	{ "seandewar/nvimesweeper", cmd = "Nvimesweeper" },
	{ "NStefan002/speedtyper.nvim", cmd = "Speedtyper", config = true },
	{
		"Febri-i/snake.nvim",
		cmd = "SnakeStart",
		dependencies = {
			"Febri-i/fscreen.nvim",
		},
		config = true,
	},
	{
		"seandewar/killersheep.nvim",
		cmd = "KillKillKill",
		config = function()
			require("killersheep").setup({
				gore = true,
				keymaps = {
					move_left = "h",
					move_right = "l",
					shoot = "<Space>",
				},
			})
		end,
	},
}
