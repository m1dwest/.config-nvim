local function mode_bg()
    local theme = require("lualine.themes.auto") -- or your actual theme, e.g. "gruvbox"
    local mode = vim.fn.mode()

    local map = {
        n = "normal",
        i = "insert",
        v = "visual",
        V = "visual",
        ["\22"] = "visual", -- Ctrl-V block mode
        c = "command",
        R = "replace",
        s = "select",
        S = "select",
        t = "terminal",
    }

    local name = map[mode] or "normal"
    local sec = theme[name] and theme[name].a or theme.normal.a

    return {
        fg = "#141414",
        bg = sec.bg,
        gui = "bold",
    }
end

local custom_filename = {
    'filename',
    path = 1,
    newfile_status = true,
}

local custom_mode = {
    'mode',
    fmt = function(name, ctx)
        return name .. " "
    end,

}

local custom_branch = {
    'branch',
    icon = '',
    color = mode_bg,
    separator = { right = '' },
    padding = { left = 0, right = 1 },
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
    -- fdfsd
    sections = {
        lualine_a = { custom_mode },
        lualine_b = { custom_branch, 'diff' },

        lualine_c = { custom_filename },
        -- lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_x = { 'diagnostics' },
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
