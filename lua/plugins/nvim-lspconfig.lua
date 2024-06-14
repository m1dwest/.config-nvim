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
        local lspconfig = require('lspconfig')
        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

        local group = vim.api.nvim_create_augroup('lsp_cmds', { clear = true })

        -- vim.api.nvim_create_autocmd('LspAttach', {
        --     group = group,
        --     desc = 'LSP actions',
        --     callback = user.on_attach
        -- })
        vim.api.nvim_create_autocmd("BufWritePost", {
            callback = function()
                vim.lsp.buf.format()
            end,
        })

        require('mason-lspconfig').setup({
            ensure_installed = {
                'lua_ls',
                'clangd',
                'rust_analyzer',
                -- 'hls',
                'pyright',
                'efm',
                'tsserver',
                'bashls'
            },
            handlers = {
                -- See :help mason-lspconfig-dynamic-server-setup
                function(server)
                    -- See :help lspconfig-setup
                    lspconfig[server].setup({
                        capabilities = lsp_capabilities,
                    })
                end,
                ['lua_ls'] = function()
                    require('plugins.lsp.lua_ls')
                end,
                ['clangd'] = function()
                    lspconfig.clangd.setup({
                        capabilities = lsp_capabilities,
                        cmd = { "clangd", "-background-index" },
                    })
                end,
                ['rust_analyzer'] = function()
                    lspconfig.rust_analyzer.setup({
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
                    lspconfig.hls.setup({
                        filetypes = { "haskell", "lhaskell", "hs" },
                        capabilities = lsp_capabilities,
                    })
                end,
                ['pyright'] = function()
                    lspconfig.pyright.setup {}
                end,
                ['efm'] = function()
                    lspconfig.efm.setup({
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
                ['tsserver'] = function()
                    lspconfig.tsserver.setup {}
                end,
                ['bashls'] = function()
                    lspconfig.bashls.setup {}
                end,
            }
        })
    end,
}
