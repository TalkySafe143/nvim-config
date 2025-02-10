return {
    "akinsho/bufferline.nvim",
    opts = {
        options = {
            mode = "tabs",
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(count, level, diag, context)
                local s = " "
                for e, n in pairs(diag) do
                    local sym = e == "error" and " " or (e == "warning" and " " or " ")
                    s = s .. n .. sym
                end
                return s
            end,
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "Neo-tree",
                    separator = true,
                    highlight = "Directory",
                    text_align = "left",
                },
            },
        },
    },
    config = function(_, opts)
        require("bufferline").setup(opts)
        vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
            callback = function()
                vim.schedule(function()
                    pcall(nvim_bufferline)
                end)
            end,
        })
    end,
}

