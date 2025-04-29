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
    { 'nyoom-engineering/oxocarbon.nvim', name = 'oxocarbon' }
}
