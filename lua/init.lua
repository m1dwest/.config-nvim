return {
  {'folke/tokyonight.nvim'},
  {'catppuccin/nvim', name = 'catppuccin'},
  {'rose-pine/neovim', name = 'rose-pine',
    config = function()
      require('rose-pine').setup({
        disable_italics = true,
        variant = 'auto', -- auto, main, moon, dawn
        dark_variant = 'main' -- main, moon, dawn
      })
    end,
  }
}

