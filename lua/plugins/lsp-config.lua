return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd",
					"lua_ls",
					"ts_ls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

            local servers = {
                "lua_ls",
                "clangd",
                "ts_ls",
                "astro",
                "csharp_ls",
                "cssls",
                "dockerls",
                "html",
                "jdtls",
                "pyright",
                "texlab",
                "buf_ls",
                "cmake",
                "tailwindcss",
            }

            for _, server in ipairs(servers) do
                lspconfig[server].setup({
                    capabilities = capabilities,
                })
            end

			--lspconfig.lua_ls.setup({
				--capabilities = capabilities,
			-- })
			--lspconfig.clangd.setup({
				--capabilities = capabilities,
			-- })
			--lspconfig.ts_ls.setup({
				--capabilities = capabilities,
			-- })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
