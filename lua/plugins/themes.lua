return {
    { 'folke/tokyonight.nvim' },
    { 'bluz71/vim-moonfly-colors' },
    { 'Th3Whit3Wolf/space-nvim' },
    { 'rockerBOO/boo-colorscheme-nvim' },
    { 'yonlu/omni.vim' },
    { 'FrenzyExists/aquarium-vim' },
    { 'tiagovla/tokyodark.nvim' },
    { 'saltdotac/citylights.vim' },
    { 'colepeters/spacemacs-theme.vim' },
    { 'koirand/tokyo-metro.vim' },
    { 'catppuccin/nvim',               name = 'catppuccin' },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            require('rose-pine').setup({
                disable_italics = true,
                variant = 'auto',     -- auto, main, moon, dawn
                dark_variant = 'main' -- main, moon, dawn
            })
        end,
    },
    { 'dracula/vim',                      name = 'dracula' },
    { 'rainglow/vim',                     name = 'rainglow' },
    { 'nyoom-engineering/oxocarbon.nvim', name = 'oxocarbon' },
    { 'ilof2/posterpole.nvim',            name = 'posterpole' },
    { 'ramojus/mellifluous.nvim',         name = 'mellifluous' },
    { 'rebelot/kanagawa.nvim',            name = 'kanagawa' },
    { 'dasupradyumna/midnight.nvim',      name = 'midnight' },
    {
        'sainnhe/gruvbox-material',
        name = 'gruvbox-material',
        config = function()
            require('mellifluous').setup({
                colorset = "kanagawa_dragon",
            })
        end
    },
    {
        'vague-theme/vague.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require("vague").setup({
            })
        end
    },
    {
        "scottmckendry/cyberdream.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "thesimonho/kanagawa-paper.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    }
}
