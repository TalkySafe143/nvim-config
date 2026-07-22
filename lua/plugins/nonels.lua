return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local helpers = require("null-ls.helpers")

		local mail_formatter = helpers.make_builtin({
			name = "par",
			meta = {
				url = "http://www.amk.ca/python/code/par.html",
				description = "Mail formatter",
			},
			method = null_ls.methods.FORMATTING,
			filetypes = { "mail" },
			generator = helpers.formatter_factory({
				command = "par",
				args = { "w72q" }, -- w72 especifica el ancho. 'q' respeta los prefijos de cita '>'
				to_stdin = true,
			}),
		})
		null_ls.setup({
			sources = {
				-- null_ls.builtins.formatting.stylua,
				-- null_ls.builtins.formatting.clang_format,
				-- null_ls.builtins.formatting.prettier,
				-- null_ls.builtins.formatting.black,
				-- null_ls.builtins.formatting.isort,
				-- null_ls.builtins.formatting.stylua,
				mail_formatter,
			},
		})
	end,
}
