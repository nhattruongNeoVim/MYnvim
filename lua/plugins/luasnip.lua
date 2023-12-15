return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
    config = function()
		local lpath = vim.fn.stdpath("config") .. "/snippets"

		-- require("luasnip.loaders.from_vscode").lazy_load()
		-- -- specify the full path...
		-- require("luasnip.loaders.from_vscode").lazy_load({
		--   paths = lpath .. "/B5-Snippets",
		-- })
		-- require("luasnip.loaders.from_vscode").lazy_load({
		--   paths = lpath .. "/laravel-blade",
		-- })
		-- require("luasnip.loaders.from_vscode").lazy_load({
		--   paths = lpath .. "/laravel-blade2",
		-- })
		-- require("luasnip.loaders.from_vscode").lazy_load({
		--   paths = lpath .. "/laravel5",
		-- })
		-- require("luasnip.loaders.from_vscode").lazy_load({
		--   paths = lpath .. "/javascript",
		-- })
		require("luasnip.loaders.from_vscode").lazy_load({
			paths = lpath .. "/html",
		})
		require("luasnip.loaders.from_vscode").lazy_load({
			paths = lpath .. "/javascript-snippet",
		})
		-- require("luasnip.loaders.from_vscode").lazy_load({
		--   paths = lpath .. "/codeigniter4",
		-- })
		-- require("luasnip.loaders.from_vscode").lazy_load({
		-- 	paths = lpath .. "/font-awesome",
		-- })

		--require("luasnip.loaders.from_vscode").load({ paths = lpath .. "/B5-Snippets" })
		--require("luasnip.loaders.from_vscode").load({ paths = lpath .. "/laravel-blade" })
		--require("luasnip.loaders.from_vscode").load({ paths = lpath .. "/laravel-blade2" })
		--require("luasnip.loaders.from_vscode").load({ paths = lpath .. "/laravel5" })
		--require("luasnip.loaders.from_vscode").load({ paths = lpath .. "/javascript" })
		--require("luasnip.loaders.from_vscode").load({ paths = lpath .. "/html" })
		--require("luasnip.loaders.from_vscode").load({ paths = lpath .. "/codeigniter4" })
		--require("luasnip.loaders.from_vscode").load({ paths = lpath .. "/font-awesome" })
		--require("luasnip.loaders.from_vscode").load({ paths = lpath .. "/javascript-snippet" })
    end
}
