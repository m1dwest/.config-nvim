
local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map("n", "<leader><C-f>", "<cmd>Telescope find_files<CR>");
