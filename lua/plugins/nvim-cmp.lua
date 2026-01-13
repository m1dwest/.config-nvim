-- local ELLIPSIS_CHAR = "…"
-- local MAX_LABEL_WIDTH = 20
-- local MIN_LABEL_WIDTH = 20

return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-path",
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-calc',
        "onsails/lspkind.nvim"
    },
    event = "InsertEnter",
    config = function()
        vim.opt.completeopt = { "menu", "menuone", "preview" }
        local cmp = require("cmp")
        local lspkind = require('lspkind')
        local cmp_window_config = {
            winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
        }

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            formatting = {
                -- format = function(entry, vim_item)
                --     local label = vim_item.abbr
                --     local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
                --     if truncated_label ~= label then
                --         vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
                --     elseif string.len(label) < MIN_LABEL_WIDTH then
                --         local padding = string.rep(" ", MIN_LABEL_WIDTH - string.len(label))
                --         vim_item.abbr = label .. padding
                --     end
                --     return vim_item
                -- end,

                format = lspkind.cmp_format({
                    mode = 'symbol_text',
                    maxwidth = 50,
                    ellipsis_char = '...',
                    show_labelDetails = true,
                })
            },
            window = {
                completion = cmp.config.window.bordered(cmp_window_config),
                documentation = cmp.config.window.bordered(cmp_window_config)
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
            }, {
                { name = "buffer" },
            }, {
                { name = "path" },
            }),
        })

        cmp.setup.filetype("gitcommit", {
            sources = cmp.config.sources({
                { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
            }, {
                { name = "buffer" },
            }),
        })
    end
}
