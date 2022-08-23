local g = vim.g
local o = vim.opt

o.termguicolors = true
vim.cmd [[colorscheme aquarium]]

g.nomodeline = true

o.hidden = true
o.timeoutlen = 500
o.updatetime = 200
o.scrolloff = 5
o.wildmenu = true
o.wildmode = 'list:longest'
o.showmode = false
o.showcmd = true
o.visualbell = true
o.clipboard = 'unnamedplus'
o.directory = vim.env.HOME .. '/.nvim/swap'

-- indentation
o.cindent = true
o.smarttab = true
o.expandtab = true
o.tabstop = 4
o.shiftwidth = 0
o.softtabstop = -1

-- ui
o.number = true
o.relativenumber = true
o.numberwidth = 5

-- o.signcolumn = 'yes:2'
o.signcolumn = 'yes'
o.cursorline = true


o.wrap = true
o.textwidth = 300
-- o.list = true
-- o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'

o.ignorecase = true
o.smartcase = true

o.undofile = true
-- o.swapfile = false
-- o.backupdir = '/tmp/'
-- o.directory = '/tmp/'
-- o.undodir = '/tmp/'

o.history = 100

-- Better buffer splitting
o.splitright = true
o.splitbelow = true
