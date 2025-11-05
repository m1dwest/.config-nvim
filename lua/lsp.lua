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

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
  end,
})

vim.lsp.enable('clangd')
vim.lsp.enable('lua_ls')

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
