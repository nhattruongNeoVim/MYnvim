return {
    { "alec-gibson/nvim-tetris",  cmd = "Tetris" },
    { "ThePrimeagen/vim-be-good", cmd = "VimBeGood" },
    { "seandewar/nvimesweeper",   cmd = "Nvimesweeper" },
    { "zyedidia/vim-snake",       cmd = "Snake" },
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
