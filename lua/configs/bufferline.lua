require("bufferline").setup({
    options = {
        mode = "buffers",
        numbers = "none",
        indicator = {
            icon = "▎",
        },
        modified_icon = "●",
        left_trunc_marker = "",
        right_trunc_marker = "",
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = false,
        separator_style = "slant",
        always_show_bufferline = true,

        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return "(" .. count .. ")"
        end,

        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
            },
        },
    },
})

vim.cmd([[
        augroup MyColors
        autocmd!
        autocmd ColorScheme * highlight BufferLineFill guibg=#100000
        autocmd ColorScheme * highlight BufferLineSeparator guifg=#100000
        autocmd ColorScheme * highlight BufferLineSeparatorSelected guifg=#100000
        autocmd ColorScheme * highlight BufferLineSeparatorVisible guifg=#100000
        augroup END
    ]])

vim.keymap.set("n", "zh", ":BufferLineCyclePrev<CR>", { silent = true })
vim.keymap.set("n", "zl", ":BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set("n", "zH", ":BufferLineMovePrev<CR>", { silent = true })
vim.keymap.set("n", "zL", ":BufferLineMoveNext<CR>", { silent = true })
vim.keymap.set("n", "zp", ":BufferLinePick<CR>", { silent = true })
vim.keymap.set("n", "<leader>c", ":BufferLinePickClose<CR>", { silent = true })
