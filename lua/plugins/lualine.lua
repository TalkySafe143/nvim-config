-- stylua: ignore
local colors = {
    blue   = '#80a0ff',
    cyan   = '#79dac8',
    black  = '#080808',
    white  = '#c6c6c6',
    red    = '#ff5189',
    violet = '#d183e8',
    grey   = '#303030',
}

local bubbles_theme = {
    normal = {
        a = { fg = colors.black, bg = colors.violet },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.white },
    },

    insert = { a = { fg = colors.black, bg = colors.blue } },
    visual = { a = { fg = colors.black, bg = colors.cyan } },
    replace = { a = { fg = colors.black, bg = colors.red } },
    command = { a = { fg = colors.black, bg = colors.red } },

    inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white },
    },
}

function vim_logo_mode()
    local mode = vim.fn.mode()
    local mode_map = {
        n = 'NORMAL',
        i = 'INSERT',
        v = 'VISUAL',
        V = 'V-LINE',
        ['\22'] = 'V-BLOCK',
        c = 'COMMAND',
    }

    local icon = '' -- icono de Vim (Nerd Font)
    return icon .. ' ' .. (mode_map[mode] or mode)
end

return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        "meuter/lualine-so-fancy.nvim",
    },
    config = function()
        require('lualine').setup({
            options = {
                theme = bubbles_theme,
                component_separators = '',
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = { { vim_logo_mode, separator = { left = '', right = '' }, right_padding = 2 } },
                lualine_b = { { 'filename', 'fancy_branch' } },
                lualine_c = {
                    -- '%=', --[[ add your center components here in place of this comment ]]
                    'fancy_diff',
                    'fancy_diagnostics',
                    {
                        'navic',
                        color_correction = "static",
                        fmt = function(str)
                            return "%=" .. str .. "%="
                        end
                    }

                },
                lualine_x = {},
                lualine_y = { 'filetype', 'progress' },
                lualine_z = {
                    { 'fancy_location', separator = { right = '' }, left_padding = 2 },
                },
            },
            inactive_sections = {
                lualine_a = { 'filename' },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { 'location' },
            },
            tabline = {},
            extensions = { 'neo-tree' },
        })
    end
}
