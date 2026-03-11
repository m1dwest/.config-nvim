return {
    'saghen/blink.indent',
    event = "VeryLazy",
    config = function()
        require('blink.indent').setup({
            scope = {
                highlights = { 'BlinkIndentScope' }
            }
        })
    end
}
