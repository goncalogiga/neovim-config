vim.api.nvim_set_keymap('n', '<A-i>', ':AvanteAsk<CR>', {noremap = true})

require('avante_lib').load()
require("avante").setup({
    provider = "openai",
    auto_suggestions_provider = "openai",
    openai = {
        endpoint = "https://copilot.deploy.huruk.ai/api",
        model = "deepseek-ai/DeepSeek-R1-Distill-Qwen-14B",
        temperature = 0,
        max_tokens = 10000,
    }
})
