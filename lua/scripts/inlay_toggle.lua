local M = {}

local state_file = vim.fn.stdpath("state") .. "/inlay_toggle.json"

local function read_state()
    local ok_read, lines = pcall(vim.fn.readfile, state_file)

    if not ok_read or not lines or #lines == 0 then
        return false
    end

    local ok_decode, decoded = pcall(vim.fn.json_decode, table.concat(lines, "\n"))
    if not ok_decode or type(decoded) ~= "table" then
        return false
    end

    return decoded.enabled == true
end

local function write_state(val)
    vim.fn.mkdir(vim.fn.fnamemodify(state_file, ":h"), "p")
    local encoded = vim.fn.json_encode({ enabled = val })
    vim.fn.writefile({ encoded }, state_file)
end

function M.get()
    if vim.g.inlay_toggle == nil then
        vim.g.inlay_toggle = read_state()
    end

    vim.lsp.inlay_hint.enable(vim.g.inlay_toggle)
    return vim.g.inlay_toggle
end

function M.set(val)
    vim.g.inlay_toggle = val
    vim.lsp.inlay_hint.enable(val)
    write_state(val)
end

function M.toggle()
    M.set(not M.get())
end

M.get()

return M
