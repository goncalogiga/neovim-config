-- * LSP CONFIG FILE *

local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'pyright',
  'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_insert = {behavior = cmp.SelectBehavior.Insert}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_insert),
  ['<Tab>'] = cmp.mapping.select_next_item(cmp_insert),
})


-- For this part to work you need to install these plugins:
-- hrsh7th/cmp-path
-- hrsh7th/cmp-nvim-lsp
-- hrsh7th/cmp-buffer
-- saadparwaiz1/cmp_luasnip
-- rafamadriz/friendly-snippets
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
require('luasnip.loaders.from_vscode').lazy_load()
cmp.setup({
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
  }
})


lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "<leader>ek", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "<leader>ej", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

-- Ruff linting for python
-- https://github.com/astral-sh/ruff/blob/main/crates/ruff_server/docs/setup/NEOVIM.md
require('lspconfig').ruff.setup {}

-- Deperecated: using ruff instead of pyright
-- Python LSP settings (all settings can be found here
-- https://github.com/microsoft/pyright/blob/main/docs/settings.md)
-- require('lspconfig').pyright.setup({
--     settings = {
--         python = {
--             analysis = {
--                 typeCheckingMode = "off",
--                 autoSearchPaths = true,
--                 useLibraryCodeForTypes = true,
--                 diagnosticMode = 'openFilesOnly'
--             }
--         }
--     }
-- })
