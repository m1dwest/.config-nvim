vim.api.nvim_create_autocmd("BufWritePost", {
    group = vim.api.nvim_create_augroup("Packer", { clear = true }),
    pattern = "plugins.lua",
    command = "source <afile> | PackerCompile",
})

return require("packer").startup({
    function(use)
        use("wbthomason/packer.nvim")
        use("lewis6991/impatient.nvim")

        use("MunifTanjim/nui.nvim")

        -- colorschemes

        use("bluz71/vim-moonfly-colors")
        use("Th3Whit3Wolf/space-nvim")
        use("rockerBOO/boo-colorscheme-nvim")
        use("yonlu/omni.vim")
        use("FrenzyExists/aquarium-vim")
        use("tiagovla/tokyodark.nvim")
        use("saltdotac/citylights.vim")
        use("colepeters/spacemacs-theme.vim")
        use("koirand/tokyo-metro.vim")

        use({
            "dracula/vim",
            as = "dracula-vim",
        })

        use({
            "rainglow/vim",
            as = "rainglow-vim",
        })

        -- git

        use({
            "lewis6991/gitsigns.nvim",
            event = "BufRead",
            config = function()
                require("configs.gitsigns")
            end,
        })

        use({
            "tpope/vim-fugitive",
            config = function()
                vim.keymap.set("n", "<leader>gg", "<cmd>G<CR>")
            end,
        })

        -- ui

        require("configs.dashboard-nvim")
        use({
            "glepnir/dashboard-nvim",
            config = function()
                require("configs.dashboard-nvim").setup()
            end,
        })

        use({
            "kyazdani42/nvim-tree.lua",
            config = function()
                require("configs.nvim-tree")
            end,
        })

        use({
            {
                "nvim-lualine/lualine.nvim",
                event = "BufEnter",
                config = function()
                    require("configs.lualine")
                end,
            },
            {
                "j-hui/fidget.nvim",
                after = "lualine.nvim",
                config = function()
                    require("fidget").setup({
                        text = {
                            spinner = "dots",
                        },
                    })
                end,
            },
        })

        use({
            "folke/trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require("trouble").setup({
                    -- TODO config
                })
            end,
        })

        -- use({
        -- 	"VonHeikemen/searchbox.nvim",
        -- 	requires = {
        -- 		{ "MunifTanjim/nui.nvim" },
        -- 	},
        -- })

        -- use({
        -- 	"VonHeikemen/fine-cmdline.nvim",
        -- 	requires = {
        -- 		{ "MunifTanjim/nui.nvim" },
        -- 	},
        -- })

        -- use "lukas-reineke/indent-blankline.nvim"

        use({
            "norcalli/nvim-colorizer.lua",
            event = "CursorHold",
            config = function()
                require("colorizer").setup()
            end,
        })

        use({
            "folke/todo-comments.nvim",
            requires = "nvim-lua/plenary.nvim",
            -- event = "BufRead",
            config = function()
                require("todo-comments").setup()
            end,
        })

        use({
            "kyazdani42/nvim-web-devicons",
            config = function()
                require("nvim-web-devicons").setup()
            end,
        })

        use({
            "akinsho/bufferline.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require("configs.bufferline")
            end,
        })

        use({
            "folke/which-key.nvim",
            config = function()
                require("which-key").setup {
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                }
            end
        })

        -- lsp and syntax

        use({
            "neovim/nvim-lspconfig",
            config = function()
                require("configs.lspconfig").setup()
            end,
            requires = {
                {
                    "hrsh7th/cmp-nvim-lsp",
                },
            },
        })

        use({
            "simrat39/rust-tools.nvim",
            config = function()
                require("rust-tools").setup({
                    server = {
                        on_attach = require("configs.lspconfig").on_attach
                    }
                })
            end,
        })

        use({
            {
                "hrsh7th/nvim-cmp",
                event = "InsertEnter",
                config = function()
                    require("configs.nvim-cmp")
                end,
                requires = {
                    {
                        "L3MON4D3/LuaSnip",
                        event = "InsertEnter",
                        requires = {
                            {
                                "rafamadriz/friendly-snippets",
                                event = "CursorHold",
                            },
                        },
                    },
                },
            },
            { "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
            { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
            { "hrsh7th/cmp-path", after = "nvim-cmp" },
        })

        use({
            "weilbith/nvim-code-action-menu",
            cmd = "CodeActionMenu",
            config = function()
                vim.g.code_action_menu_show_details = false
            end,
        })

        -- treesitter

        use({
            'nvim-treesitter/nvim-treesitter',
            event = 'CursorHold',
            run = ':TSUpdate',
            config = function()
                require('configs.nvim-treesitter')
            end,
        }
        -- { 'nvim-treesitter/playground', after = 'nvim-treesitter' },
        -- { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
        -- { 'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter' },
        -- { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' },
        -- { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' },
        )

        use({
            "folke/twilight.nvim",
            config = function()
                require("twilight").setup({
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                })
            end,
        })

        -- tools

        use({
            {
                "nvim-telescope/telescope.nvim",
                requires = { { "nvim-lua/plenary.nvim" } },
                config = function()
                    require("configs.telescope")
                end,
            },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                after = "telescope.nvim",
                run = "make",
                config = function()
                    require("telescope").load_extension("fzf")
                end,
            },
            {
                "nvim-telescope/telescope-symbols.nvim",
                after = "telescope.nvim",
            },
        })

        -- ux

        use("lambdalisue/suda.vim")
        use("tpope/vim-repeat")

        use({
            "tpope/vim-commentary",
            event = "BufRead",
            config = function()
                vim.cmd [[autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s]]
            end,
        })

        -- use({
        --     'tpope/vim-surround',
        --     event = 'BufRead',
        --     requires = {
        --         {
        --             'tpope/vim-repeat',
        --             event = 'BufRead',
        --         },
        --     },
        -- })

        -- use({
        --     'AndrewRadev/splitjoin.vim',
        -- })
        --     event = 'CursorHold',

        use({
            "derekwyatt/vim-fswitch",
            config = function()
                vim.keymap.set("n", "<F4>", "<cmd>FSHere<CR>")
            end,
        })

        use({
            "qpkorr/vim-bufkill",
            event = "BufEnter",
            config = function()
                vim.keymap.set("n", "<leader>w", "<cmd>BW<CR>")
            end,
        })

        use({
            "akinsho/toggleterm.nvim",
            config = function()
                require("toggleterm").setup()
                -- TODO config
            end,
        })

        -- use({
        -- 	"karb94/neoscroll.nvim",
        -- 	event = "WinScrolled",
        -- 	config = function()
        -- 		require("neoscroll").setup({ hide_cursor = false })
        -- 	end,
        -- })

        -- use({
        --     'phaazon/hop.nvim',
        --     event = 'BufRead',
        --     config = function()
        --         require('hop').setup()
        --         vim.keymap.set('n', '<S-j>', '<CMD>HopWordAC<CR>')
        --         vim.keymap.set('n', '<S-k>', '<CMD>HopWordBC<CR>')
        --     end,
        -- })
    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    },
})
