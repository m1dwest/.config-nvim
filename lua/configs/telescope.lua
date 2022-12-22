vim.api.nvim_create_autocmd("VimEnter", {
    callback = function(e)
        local git_changes = 0;
        if vim.fn.finddir('.git', vim.fn.getcwd() .. ";") ~= "" then
            git_changes = vim.fn.system("git status --porcelain | wc -l")
        end

        if e.file == '' then
            local builtin = require("telescope.builtin");
            if git_changes == 0 then
                builtin.find_files()
            else
                builtin.git_status()
            end
        end
    end
})

local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map("n", "<leader><C-f>", "<cmd>Telescope find_files<CR>");
map("n", "<leader><C-g>", "<cmd>Telescope live_grep<CR>");
map("n", "z<Space>", "<cmd>Telescope buffers<CR>");
