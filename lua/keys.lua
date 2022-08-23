local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- resizing
map('n', '<C-A-k>', '<cmd>resize +3<CR>')
map('n', '<C-A-j>', '<cmd>resize -3<CR>')
map('n', '<C-A-l>', '<cmd>vertical resize +5<CR>')
map('n', '<C-A-h>', '<cmd>vertical resize -5<CR>')

-- do not jump on star
map('n', '*', '*N')

-- center on search
map('n', 'n', 'nzz')
map('n', 'N', 'Nzz')

-- insert blank lines
map('n', '<leader>o', 'o<ESC>')
map('n', '<leader>O', 'O<ESC>')

-- move lines
map('n', '<C-j>', '<CMD>move .+1<CR>')
map('n', '<C-k>', '<CMD>move .-2<CR>')
map('x', '<C-j>', ":move '>+1<CR>gv=gv")
map('x', '<C-k>', ":move '<-2<CR>gv=gv")

-- escaping terminal mode
map('t', '<leader><Esc>', '<C-\\><C-n>')
