return {
	-- "iamcco/markdown-preview.nvim",
	-- build = "cd app && npm install",
	-- event = "BufRead",
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && npm install",
	event = "BufRead",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	ft = { "markdown" },
}
