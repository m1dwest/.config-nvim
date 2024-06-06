return { 'nvim-telescope/telescope.nvim',
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
            {'nvim-telescope/telescope-symbols.nvim'} ,
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build =
            'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
        },
        {
            'nvim-telescope/telescope-frecency.nvim',
            config = function()
                require('telescope').load_extension 'frecency'
            end
        }
    },
    keys = {
        { '<leader><C-f>', '<cmd>Telescope find_files<cr>' },
        { '<leader><C-g>', '<cmd>Telescope live_grep<cr>' },
        { "zZ",      '<cmd>Telescope buffers<cr>' }
    }
}

-- vim.api.nvim_create_autocmd("VimEnter", {
--     callback = function(e)
--         local git_changes = 0;
--         if vim.fn.finddir('.git', vim.fn.getcwd() .. ";") ~= "" then
--             git_changes = vim.fn.system("git status --porcelain | wc -l")
--         end
--
--         if e.file == '' then
--             local builtin = require("telescope.builtin");
--             if git_changes == 0 then
--                 builtin.find_files()
--             else
--                 builtin.git_status()
--             end
--         end
--     end
-- })
