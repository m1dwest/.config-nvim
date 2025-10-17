local user = {}

-- local M = {}
--
-- M.on_attach = function()
--     vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
--     vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
--     vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = 0 })
--
--     vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
--     vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
--
--     vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, { buffer = 0 })
--     vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, { buffer = 0 })
--
--     vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { buffer = 0 })
--
--     vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
-- end


return {
    'neovim/nvim-lspconfig',
    dependencies = {
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'williamboman/mason-lspconfig.nvim' },
    },
    cmd = { 'LspInfo', 'LspInstall', 'LspUnInstall' },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

        local group = vim.api.nvim_create_augroup('lsp_cmds', { clear = true })

        -- vim.api.nvim_create_autocmd('LspAttach', {
        --     group = group,
        --     desc = 'LSP actions',
        --     callback = user.on_attach
        -- })
        vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function()
                vim.lsp.buf.format()
            end,
        })
        vim.api.nvim_create_user_command('Format', function()
            vim.lsp.buf.format()
        end, {})
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
        -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
        vim.keymap.set("n", "gr", vim.lsp.buf.references, {})

        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {})
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})

        vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {})
        vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {})

        vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, {})

        vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

        vim.lsp.config('mason-lspconfig', {
            ensure_installed = {
                'lua_ls',
                'clangd',
                'rust_analyzer',
                -- 'hls',
                'pyright',
                'efm',
                'ts_ls',
                'bashls',
                'cmake',
                'gopls'
            },
            handlers = {
                -- See :help mason-lspconfig-dynamic-server-setup
                function(server)
                    -- See :help lspconfig-setup
                    --
                    vim.lsp.config(server, {
                        capabilities = lsp_capabilities,
                    })
                end,
                ['lua_ls'] = function()
                    require('plugins.lsp.lua_ls')
                end,
                ['clangd'] = function()

                    vim.lsp.config('clangd', {
                        capabilities = lsp_capabilities,
                        cmd = { "clangd", "--background-index", "--fallback-style=google" },
                    })
                end,
                ['rust_analyzer'] = function()
                    vim.lsp.config('rust_analyzer', {
                        capabilities = lsp_capabilities,
                        settings = {
                            ['rust-analyzer'] = {
                                checkOnSave = {
                                    allFeatures = true,
                                    overrideCommand = {
                                        'cargo', 'clippy', '--workspace', '--message-format=json',
                                        '--all-targets', '--all-features'
                                    }
                                }
                            }
                        }
                    })
                end,
                ['hls'] = function()
                    vim.lsp.config('hls', {
                        filetypes = { "haskell", "lhaskell", "hs" },
                        capabilities = lsp_capabilities,
                    })
                end,
                ['pyright'] = function()
                end,
                ['efm'] = function()
                    vim.lsp.config('efm', {
                        flags = {
                            debounce_text_changes = 150,
                        },
                        init_options = { documentFormatting = true },
                        filetypes = { "python" },
                        settings = {
                            rootMarkers = { ".git/" },
                            languages = {
                                python = {
                                    { formatCommand = "black --quiet -", formatStdin = true }
                                },
                                bash = {
                                    formatCommand = "shfmt -ci -s -bn", formatStdin = true
                                }
                            }
                        }
                    })
                end,
                ['ts_ls'] = function()
                end,
                ['bashls'] = function()
                end,
                ['cmake'] = function()
                    vim.lsp.config('cmake', {
                        filetypes = { "cmake" },
                        buildDirectory = "../build",
                    })
                end,
            }
        })
    end,
}
