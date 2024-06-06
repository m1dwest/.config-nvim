local plugin = {'nvim-treesitter/nvim-treesitter'}

plugin.dependencies = {
  {'nvim-treesitter/nvim-treesitter-textobjects'}
}

plugin.opts = {
    auto_install = true,
    ensure_installed = {
        'c',
        'cpp',
        'lua',
        'python',
        'rust',
        'go',
        'markdown',
        'markdown_inline',
        'json',
        'bash',
        'yaml',
        'javascript'
    },
    highlight = {
        enable = true,
    },
    indent = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gs',
            -- NOTE: These are visual mode mappings
            node_incremental = 'gs',
            node_decremental = 'gS',
            scope_incremental = '<leader>gc',
        },
    },
}

function plugin.config(name, opts)
  require('nvim-treesitter.configs').setup(opts)
end

return plugin
