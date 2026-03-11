vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

return {
    "williamboman/mason.nvim",
    event = "CmdlineEnter",
    opts = {
        ui = { border = "rounded" },
    }
}
