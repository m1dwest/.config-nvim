local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable',
      path,
    })
  end
end

function lazy.setup(plugins)
  if vim.g.plugins_ready then
    return
  end

  lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)

  require('lazy').setup(plugins, lazy.opts)
  vim.g.plugins_ready = true
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({{import = 'plugins' }})

--         use("MunifTanjim/nui.nvim")
--
--         -- require("configs.dashboard-nvim")
--         -- use({
--         --     "glepnir/dashboard-nvim",
--         --     config = function()
--         --         require("configs.dashboard-nvim").setup()
--         --     end,
--         -- })
--
--         -- use({
--         -- 	"VonHeikemen/searchbox.nvim",
--         -- 	requires = {
--         -- 		{ "MunifTanjim/nui.nvim" },
--         -- 	},
--         -- })
--
--         -- use({
--         -- 	"VonHeikemen/fine-cmdline.nvim",
--         -- 	requires = {
--         -- 		{ "MunifTanjim/nui.nvim" },
--         -- 	},
--         -- })
--
--         -- use({
--         --     'tpope/vim-surround',
--         --     event = 'BufRead',
--         --     requires = {
--         --         {
--         --             'tpope/vim-repeat',
--         --             event = 'BufRead',
--         --         },
--         --     },
--         -- })
--
--         -- use({
--         --     'AndrewRadev/splitjoin.vim',
--         -- })
--         --     event = 'CursorHold',
--
--         -- use({
--         -- 	"karb94/neoscroll.nvim",
--         -- 	event = "WinScrolled",
--         -- 	config = function()
--         -- 		require("neoscroll").setup({ hide_cursor = false })
--         -- 	end,
--         -- })
--
--         -- use({
--         --     'phaazon/hop.nvim',
--         --     event = 'BufRead',
--         --     config = function()
--         --         require('hop').setup()
--         --         vim.keymap.set('n', '<S-j>', '<CMD>HopWordAC<CR>')
--         --         vim.keymap.set('n', '<S-k>', '<CMD>HopWordBC<CR>')
--         --     end,
--         -- })
