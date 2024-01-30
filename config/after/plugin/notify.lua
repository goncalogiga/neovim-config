require("notify").setup {
    render = "wrapped-compact",
    stages = 'fade_in_slide_out',
    background_colour = 'FloatShadow',
    timeout = 2000,
}

vim.notify = require("notify")
