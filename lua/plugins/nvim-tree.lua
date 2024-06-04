local plugin = {'kyazdani42/nvim-tree.lua'}

plugin.cmd = { 'NvimTreeToggle' }

plugin.opts = {
    disable_netrw = true,
    hijack_cursor = true,
    prefer_startup_root = true,

    diagnostics = {
        enable = true,
    },

    update_focused_file = {
        enable = true,
        update_root = true,
    },

    view = {
        width = 35,
        side = 'left',
        preserve_window_proportions = true,
        number = false,
    },

    filters = {
        custom = { '.git$' },
    },

    git = {
        ignore = false,
    },

    actions = {
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },

    renderer = {
        full_name = false,
        highlight_opened_files = 'all',
        icons = {
            show = {
                git = true,
                folder = true,
                file = true,
                folder_arrow = false,
            },
            glyphs = {
                default = '',
                git = {
                    unstaged = '~',
                    staged = '+',
                    unmerged = '!',
                    renamed = '≈',
                    untracked = '?',
                    deleted = '-',
                },
            },
        },
        indent_markers = {
            enable = true,
        },
    },
}

plugin.keys = {
      { '<C-n>', '<CMD>NvimTreeToggle<CR>', desc = 'NvimTree' },
}

return plugin
