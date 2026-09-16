return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				cpp = { "clang-format" },
				cmake = { "cmake_format" },
			},
			format_on_save = {
				lsp_format = "never",
				timeout_ms = 500,
			},
		})
	end,
}
