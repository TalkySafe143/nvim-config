return {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
        {
            "<leader>xx",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
       },
       {
            "<leader>xm",
            "<cmd>Trouble todo toggle<cr>",
            desc = "Diagnostics (To dos)",
       },
    },
}
