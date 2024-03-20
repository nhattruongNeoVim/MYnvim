return {
	"folke/todo-comments.nvim",
	event = "BufRead",
	opts = {
		-- PERF: fully optimised
		-- HACK: hmm, this looks a bit funky
		-- TODO: what else ?
		-- NOTE: adding a note
		-- FIX: this needs fixing
		-- WARNING: ???
		signs = false, -- show icons in the signs column
		keywords = {
			FIXX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
			TODO = { icon = " ", color = "info" },
			HACK = { icon = " ", color = "warning" },
			WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
			PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
			TEST = { icon = " ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
		},
	},
}
