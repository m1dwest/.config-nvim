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
--
--         -- git
--
--         use({
--             "tpope/vim-fugitive",
--             config = function()
--                 vim.keymap.set("n", "<leader>gg", "<cmd>G<CR>")
--             end,
--         })
--
--         -- ui
--
--         -- require("configs.dashboard-nvim")
--         -- use({
--         --     "glepnir/dashboard-nvim",
--         --     config = function()
--         --         require("configs.dashboard-nvim").setup()
--         --     end,
--         -- })
--
--
--         use({
--             {
--                 "nvim-lualine/lualine.nvim",
--                 event = "BufEnter",
--                 config = function()
--                     require("configs.lualine")
--                 end,
--             },
--             {
--                 "j-hui/fidget.nvim",
--                 after = "lualine.nvim",
--                 config = function()
--                     -- require("fidget").setup({
--                     --     text = {
--                     --         spinner = "dots",
--                     --     },
--                     -- })
--                 end,
--             },
--         })
--
--         use({
--             "folke/trouble.nvim",
--             requires = "kyazdani42/nvim-web-devicons",
--             config = function()
--                 require("trouble").setup({
--                     -- TODO config
--                 })
--             end,
--         })
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
--         use({
--             "lukas-reineke/indent-blankline.nvim"
--         })
--
--         use({
--             "norcalli/nvim-colorizer.lua",
--             event = "CursorHold",
--             config = function()
--                 require("colorizer").setup()
--             end,
--         })
--
--         use({
--             "folke/todo-comments.nvim",
--             requires = "nvim-lua/plenary.nvim",
--             -- event = "BufRead",
--             config = function()
--                 require("todo-comments").setup()
--             end,
--         })
--
--         use({
--             "kyazdani42/nvim-web-devicons",
--             config = function()
--                 require("nvim-web-devicons").setup()
--             end,
--         })
--
--         use({
--             "akinsho/bufferline.nvim",
--             requires = "kyazdani42/nvim-web-devicons",
--             config = function()
--                 require("configs.bufferline")
--             end,
--         })
--
--         use({
--             "folke/which-key.nvim",
--             config = function()
--                 require("which-key").setup {
--                     -- your configuration comes here
--                     -- or leave it empty to use the default settings
--                     -- refer to the configuration section below
--                 }
--             end
--         })
--
--         -- lsp and syntax
--
--         use({
--             "neovim/nvim-lspconfig",
--             config = function()
--                 require("configs.lspconfig").setup()
--             end,
--             requires = {
--                 {
--                     "hrsh7th/cmp-nvim-lsp",
--                 },
--             },
--         })
--
--         use({
--             "simrat39/rust-tools.nvim",
--             config = function()
--                 require("rust-tools").setup({
--                     server = {
--                         on_attach = require("configs.lspconfig").on_attach
--                     }
--                 })
--             end,
--         })
--
--         use({
--             {
--                 "hrsh7th/nvim-cmp",
--                 event = "InsertEnter",
--                 config = function()
--                     require("configs.nvim-cmp")
--                 end,
--                 requires = {
--                     {
--                         "L3MON4D3/LuaSnip",
--                         event = "InsertEnter",
--                         requires = {
--                             {
--                                 "rafamadriz/friendly-snippets",
--                                 event = "CursorHold",
--                             },
--                         },
--                     },
--                 },
--             },
--             { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
--             { "hrsh7th/cmp-buffer",       after = "nvim-cmp" },
--             { "hrsh7th/cmp-path",         after = "nvim-cmp" },
--         })
--
--         use({
--             "weilbith/nvim-code-action-menu",
--             cmd = "CodeActionMenu",
--             config = function()
--                 vim.g.code_action_menu_show_details = false
--             end,
--         })
--
--         use({
--             "folke/twilight.nvim",
--             config = function()
--                 require("twilight").setup({
--                     -- your configuration comes here
--                     -- or leave it empty to use the default settings
--                     -- refer to the configuration section below
--                 })
--             end,
--         })
--
--
--         -- ux
--
--         use("lambdalisue/suda.vim")
--         use("tpope/vim-repeat")
--
--         use({
--             "tpope/vim-commentary",
--             event = "BufRead",
--             config = function()
--                 vim.cmd [[autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s]]
--             end,
--         })
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
--         use({
--             "derekwyatt/vim-fswitch",
--             config = function()
--                 vim.keymap.set("n", "<F4>", "<cmd>FSHere<CR>")
--             end,
--         })
--
--         use({
--             "qpkorr/vim-bufkill",
--             event = "BufEnter",
--             config = function()
--                 vim.keymap.set("n", "<leader>w", "<cmd>BW<CR>")
--             end,
--         })
--
--         use({
--             "akinsho/toggleterm.nvim",
--             config = function()
--                 require("toggleterm").setup()
--                 -- TODO config
--             end,
--         })
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
--
--         if packer_bootstrap then
--             require('packer').sync()
--         end
--     end,
--     config = {
--         display = {
--             open_fn = function()
--                 return require("packer.util").float({ border = "single" })
--             end,
--         },
--     },
-- })
