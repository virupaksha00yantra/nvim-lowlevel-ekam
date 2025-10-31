return {
	"folke/todo-comments.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local todo_comments = require("todo-comments")

		todo_comments.setup({
			keywords = {
				HACK = { icon = "􀣌 ", color = "#A7C080" },
				TODO = { icon = "􀇻 ", color = "#7FBBB3", alt = { "TO-DO" } },
				BUG = { icon = "􁼜 ", color = "#E67E80" },
				FIX = { icon = "􀷕 ", color = "#DBBC7F", alt = { "FIXME", "FIXIT", "ISSUE" } },
				WARN = { icon = "􀇿 ", color = "#DBBC7F", alt = { "WARNING", "XXX" } },
				PERF = { icon = "􁖍 ", color = "#D699B6", alt = { "PERFORMANCE" } },
				OPTIM = { icon = "􀙭 ", color = "#D3C6AA", alt = { "OPTIMIZE" } },
				NOTE = { icon = "􀫘 ", color = "#E69875" },
				TEST = { icon = "􀐿 ", color = "#D3C6AA", alt = { "TESTING" } },
				PASSED = { icon = "􂱆 ", color = "#A7C080" },
				FAILED = { icon = "􀇽 ", color = "#E67E80" },
				INFO = { icon = "􂹛 ", color = "#7FBBB3" },
				IDEA = { icon = "􀛮 ", color = "#D699B6" },
				DOC = { icon = "􀥨 ", color = "#83C092", alt = { "DOCUMENT", "DOCUMENTATION" } },
			},
		})

		-- Set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "]t", function()
			todo_comments.jump_next()
		end, { desc = "Next todo comment" })

		keymap.set("n", "[t", function()
			todo_comments.jump_prev()
		end, { desc = "Previous todo comment" })
	end,
}

--HACK:
--TO-DO:
--BUG:
--FIX:
--FIXME:
--FIXIT:
--WARN:
--WARNING:
--XXX:
--PERF:
--OPTIM:
--OPTIMIZE:
--NOTE:
--TEST:
--TESTING:
--PASSED:
--FAILED:
--INFO:
--IDEA:
--DOC:
--DOCUMENT:
--DOCUMENTATION:
