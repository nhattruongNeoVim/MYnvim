return {
	"stevearc/conform.nvim",
	cmd = "ConformInfo",
	keys = {
		{
			"F",
			function()
				require("conform").format({
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 500,
                })
			end,
			desc = "Format Injected Langs",
		},
	},
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				cpp = { "clang_format" },
				sh = { "shfmt" },
			},
			-- format_on_save = {
			--     lsp_fallback = true,
			--     async = false,
			--     timeout_ms = 1000,
			-- },
		})
	end,
}
