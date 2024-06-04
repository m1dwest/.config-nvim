local header = [[# NeoVim dotfiles
NeoVim configuration files written in lua

## Plugins list
]]

local file = io.open('README.md', 'w')
io.output(file)
io.write(header)

local function sorted_pairs(t, f)
    local a = {}
    for n in pairs(t) do table.insert(a, n) end
    table.sort(a, f)

    local i = 0
    local iter = function()
        i = i + 1
        if a[i] == nil then
            return nil
        else
            return a[i], t[a[i]]
        end
    end
    return iter
end

local plugins = {}
for _, plugin in pairs(require('lazy').plugins()) do
    plugins[plugin[1]] = plugin['url']:gsub('[.]git$', '')
end

for name, url in sorted_pairs(plugins, function(lhs, rhs) return lhs:lower() < rhs:lower() end) do
    line = string.format('* [%s](%s)\n', name, url)
    io.write(line)
end

io.close()
