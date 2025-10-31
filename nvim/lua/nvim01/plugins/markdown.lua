return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = "markdown",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		local ok, markdown = pcall(require, "render-markdown")
		if not ok then
			return
		end

		markdown.setup({
			link = { enabled = true },
			callout = { note = { raw = "[!NOTE]", rendered = "NOTE" } },
			checkbox = { enabled = true },
			bullet = { enabled = true },
			quote = { icon = "▌" },
		})
	end,
}
