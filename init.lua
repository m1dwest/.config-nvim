local load = function(mod)
  package.loaded[mod] = nil
  return require(mod)
end

load('settings')
-- -- load('user.commands')
load('keymaps')
require('plugins')
-- --
pcall(vim.cmd.colorscheme, 'rose-pine')
