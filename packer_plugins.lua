local header = [[# NeoVim dotfiles
NeoVim configuration files written in lua

## Plugins list
]]

local file = io.open("README.md", "w")
io.output(file)
io.write(header)

for key, value in pairs(packer_plugins) do
    line = string.format("* [%s](%s)\n", key, value.url)
    io.write(line)
end

io.close()
