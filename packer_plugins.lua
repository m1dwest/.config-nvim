local header = [[# NeoVim dotfiles
NeoVim configuration files written in lua

## Plugins list
]]

local file = io.open("README.md", "w")
io.output(file)
io.write(header)

local function pairsByKeys(t, f)
    local a = {}
    for n in pairs(t) do table.insert(a, n) end
    table.sort(a, f)

    local i = 0
    local iter = function()
        i = i + 1
        if a[i] == nil then return nil
        else return a[i], t[a[i]]
        end
    end
    return iter
end

for key, value in pairsByKeys(packer_plugins, function(lhs, rhs) return lhs:lower() < rhs:lower() end) do
    line = string.format("* [%s](%s)\n", key, value.url)
    io.write(line)
end

io.close()
