require('nvim-tree').setup({
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
})

vim.keymap.set('n', '<C-n>', '<CMD>NvimTreeToggle<CR>')

vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('NVIM_TREE', { clear = true }),
    pattern = 'NvimTree',
    callback = function()
        vim.api.nvim_win_set_option(0, 'wrap', false)
    end,
})
