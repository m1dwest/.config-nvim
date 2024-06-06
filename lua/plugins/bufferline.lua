return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    lazy = false,
    config = function()
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

                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "Neo-tree",
                        highlight = "Directory",
                        text_align = "center"
                    },
                },
            },
        })
    end,
    keys = {
        { 'zh', '<CMD>BufferLineCyclePrev<CR>', desc = 'Buffer cycle previous' },
        { 'zl', '<CMD>BufferLineCycleNext<CR>', desc = 'Buffer cycle next' },
        { 'zH', '<CMD>BufferLineMovePrev<CR>',  desc = 'Buffer move previous' },
        { 'zL', '<CMD>BufferLineMoveNext<CR>',  desc = 'Buffer move next' }
    }
}
