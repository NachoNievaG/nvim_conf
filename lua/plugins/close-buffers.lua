return {
	"kazhala/close-buffers.nvim",
	config = function()
		require("close_buffers").setup({
			preserve_window_layout = { "this" },
		})
	end,
}
