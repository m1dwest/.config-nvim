local load = function(mod)
    package.loaded[mod] = nil
    return require(mod)
end

load('settings')
-- -- load('user.commands')
load('keymaps')
require('configs.lazy')
-- --
pcall(vim.cmd.colorscheme, 'oxocarbon')
