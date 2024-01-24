return {
	"ThePrimeagen/harpoon", -- Mark and  navigate buffer
	config = function()
		vim.api.nvim_create_autocmd({ "filetype" }, {
			pattern = "harpoon",
			callback = function()
				vim.cmd([[highlight link HarpoonBorder TelescopeBorder]])
			end,
		})
	end,
}
