local load = function(mod)
    package.loaded[mod] = nil
    return require(mod)
end

load('settings')
load('keymaps')
load('lsp')
require('config.lazy')

pcall(vim.cmd.colorscheme, 'vague')
