return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
}

--
--         use({
--             {
--                 "nvim-telescope/telescope.nvim",
--                 requires = { { "nvim-lua/plenary.nvim" } },
--                 config = function()
--                     require("configs.telescope")
--                 end,
--             },
--             {
--                 "nvim-telescope/telescope-fzf-native.nvim",
--                 after = "telescope.nvim",
--                 run = "make",
--                 config = function()
--                     require("telescope").load_extension("fzf")
--                 end,
--             },
--             {
--                 "nvim-telescope/telescope-symbols.nvim",
--                 after = "telescope.nvim",
--             },
--             {
--                 "nvim-telescope/telescope-frecency.nvim",
--                 config = function()
--                     require "telescope".load_extension("frecency")
--                 end,
--                 requires = { "kkharji/sqlite.lua" }
--             }
--         })
