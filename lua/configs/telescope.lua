local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map("n", "<leader><C-f>", "<cmd>Telescope find_files<CR>");
map("n", "<leader><C-g>", "<cmd>Telescope live_grep<CR>");
