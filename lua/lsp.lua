vim.lsp.config('clangd', {
    cmd = { "clangd", "--background-index", "--clang-tidy", "--fallback-style=google" },
    filetypes = { 'c', 'cpp', 'cc', 'objc', 'objcpp', 'cuda' },
    root_markers = {
        '.clangd',
        '.clang-tidy',
        '.clang-format',
        'compile_commands.json',
        'compile_flags.txt',
        'configure.ac',
        '.git',
    },
})

vim.lsp.config('lua_ls', {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = {
        '.luarc.json',
        '.luarc.jsonc',
        '.luacheckrc',
        '.stylua.toml',
        'stylua.toml',
        'selene.toml',
        'selene.yml',
        '.git',
    }
})

vim.lsp.config('basedpyright-langserver', {
    cmd = { 'basedpyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = {
        'pyrightconfig.json',
        'pyproject.toml',
        'setup.py',
        'setup.cfg',
        'requirements.txt',
        'Pipfile',
        '.git',
    },
    settings = {
        basedpyright = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = 'openFilesOnly',
            },
        },
    }
})

vim.lsp.config('ruff', {
    cmd = { 'ruff', 'server' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
    settings = {
        pyright = {
            disableOrganizeImports = true,
        },
        python = {
            analysis = {
                -- Ignore all files for analysis to exclusively use Ruff for linting
                ignore = { '*' },
            },
        },
    },
}
)

vim.lsp.config('yamlls', {
    cmd = { 'yaml-language-server', '--stdio' },
    filetypes = { 'yaml', 'yaml.docker-compose', 'yaml.gitlab', 'yaml.helm-values' },
    root_markers = { '.git' },
    settings = {
        redhat = { telemetry = { enabled = false } },
        yaml = { format = { enable = true } },
    },
    on_init = function(client)
        --- https://github.com/neovim/nvim-lspconfig/pull/4016
        --- Since formatting is disabled by default if you check `client:supports_method('textDocument/formatting')`
        --- during `LspAttach` it will return `false`. This hack sets the capability to `true` to facilitate
        --- autocmd's which check this capability
        client.server_capabilities.documentFormattingProvider = true
    end,
})

vim.lsp.config('neocmakelsp', {
    cmd = { 'neocmakelsp', '--stdio' },
    filetypes = { 'cmake' },
    root_markers = { '.git', 'build', 'cmake' },
    settings = {
        single_file_support = true,
        init_options = {
            format = {
                enable = true
            },
            lint = {
                enable = true
            },
            scan_cmake_in_package = true -- default is true
        }
    }
})

vim.lsp.enable('clangd')
vim.lsp.enable('lua_ls')
vim.lsp.enable('yamlls')
vim.lsp.enable('basedpyright-langserver')
vim.lsp.enable('ruff')
vim.lsp.enable('neocmakelsp')

-- vim.lsp.inlay_hint.enable(true)
-- Enable inlay hints whenever an LSP client attaches and supports them
-- vim.api.nvim_create_autocmd("LspAttach", {
--     group = vim.api.nvim_create_augroup("lsp_inlay_hints", { clear = true }),
--     callback = function(args)
--         local client = vim.lsp.get_client_by_id(args.data.client_id)
--     end,
-- })

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('custom.lsp', { clear = true }),
    callback = function(args)
        local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

        if not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_user_command("FormatDisable", function()
                vim.b._format_disabled = true
            end, {})

            vim.api.nvim_create_user_command("FormatEnable", function()
                vim.b._format_disabled = false
            end, {})

            vim.api.nvim_create_autocmd('BufWritePre', {
                group = vim.api.nvim_create_augroup('custom.lsp', { clear = false }),
                buffer = args.buf,
                callback = function()
                    if vim.b._format_disabled then return end
                    vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1500 })
                end,
            })
        end

        -- if client and client.server_capabilities.inlayHintProvider then
        --     vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
        -- end
    end,
})

-- local function peek_definition()
--   local params = vim.lsp.util.make_position_params()
--   vim.lsp.buf_request(0, 'textDocument/definition', params, function(err, result)
--     if err or not result or vim.tbl_isempty(result) then return end
--     local loc = result[1]
--     -- Supports Location or LocationLink
--     vim.lsp.util.preview_location(loc, { border = 'rounded' })
--   end)
-- end

-- Navigation
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { silent = true })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { silent = true })
vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { silent = true })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { silent = true })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { silent = true })

-- Info
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { silent = true })
vim.keymap.set({ 'n', 'i' }, '<C-k>', vim.lsp.buf.signature_help, { silent = true })

-- Refactor
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { silent = true })
vim.keymap.set({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action, { silent = true })
