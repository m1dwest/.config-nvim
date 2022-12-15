vim.api.nvim_create_autocmd("VimEnter", {
    callback = function(e)
        if e.file == '' then
            require("telescope.builtin").builtin()
        end
    end
})

local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map("n", "<leader><C-f>", "<cmd>Telescope find_files<CR>");
map("n", "<leader><C-g>", "<cmd>Telescope live_grep<CR>");
map("n", "z<Space>", "<cmd>Telescope buffers<CR>");
