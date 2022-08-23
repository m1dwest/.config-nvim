local lspconfig = require('lspconfig')

local on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = 0 })

    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })

    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, { buffer = 0 })
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, { buffer = 0 })
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, { buffer = 0 })

    vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { buffer = 0 })

    vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "clangd-12", "-background-index" },
}

lspconfig.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "rust", "rs" }
}

lspconfig.hls.setup {
    filetypes = { "haskell", "lhaskell", "hs" }
}

require 'lspconfig'.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            format = {
                enable = true,
            },
            diagnostics = {
                ["codestyle-check"] = "Any"
            }
        }
    }
}
