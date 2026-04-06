return {
    "SmiteshP/nvim-navic",
    depedencies = { "neovim/nvim-lspconfig" },
    config = function()
        require("nvim-navic").setup({
            lsp = {
                auto_attach = true
            }
        })
    end
}
