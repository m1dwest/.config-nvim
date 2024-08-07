local custom_filename = {
    'filename',
    path = 1,
    newfile_status = true,
}

local plugin = { 'nvim-lualine/lualine.nvim' }
plugin.dependencies = { 'nvim-tree/nvim-web-devicons' }
plugin.event = "VeryLazy"

plugin.opts = {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { custom_filename },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { custom_filename },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    winbar = {},
    inactive_winbar = {},
    extensions = { 'nvim-tree', 'neo-tree', 'fugitive', 'quickfix', 'man', 'fzf' }
}

return plugin
