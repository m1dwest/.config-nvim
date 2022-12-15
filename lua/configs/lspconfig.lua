local M = {}

M.on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = 0 })

    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })

    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, { buffer = 0 })
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, { buffer = 0 })

    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { buffer = 0 })

    vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
end

M.setup = function()
    local lspconfig = require('lspconfig')

    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

    lspconfig.clangd.setup {
        on_attach = M.on_attach,
        capabilities = capabilities,
        cmd = { "clangd-12", "-background-index" },
    }

    lspconfig.rust_analyzer.setup {
        on_attach = M.on_attach,
        capabilities = capabilities,
    }

    lspconfig.hls.setup {
        filetypes = { "haskell", "lhaskell", "hs" },
        capabilities = capabilities,
    }

    lspconfig.pyright.setup {}

    lspconfig.efm.setup {
        on_attach = M.on_attach,
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
                }
            }
        }
    }

    require 'lspconfig'.sumneko_lua.setup {
        on_attach = M.on_attach,
        capabilities = capabilities,
        settings = {
            Lua = {
                enable = true,
                format = {
                },
                diagnostics = {
                    globals = { "vim" },
                    ["codestyle-check"] = "Any"
                }
            }
        }
    }
end

return M;
