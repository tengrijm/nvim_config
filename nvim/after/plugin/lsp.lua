local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- setup language servers.
require("mason").setup()
local lspconfig = require('lspconfig')
lspconfig.pyright.setup {capabilities = capabilities}
lspconfig.lua_ls.setup {capabilities = capabilities}
lspconfig.emmet_ls.setup {capabilities = capabilities, 
filetypes = {"css", "html", "svelte", "javascript", "typescript", "less", "sass", "scss", "pug", "typescriptreact", "vue"}
}
lspconfig.tsserver.setup {capabilities = capabilities}
lspconfig.rust_analyzer.setup {capabilities = capabilities}
-- global mappings.
-- see `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>d', vim.diagnostic.goto_prev)

-- use lspattach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('lspattach', {
  group = vim.api.nvim_create_augroup('userlspconfig', {}),
  callback = function(ev)
    -- enable completion triggered by <c-x><c-o>
    -- buffer local mappings.
    -- see `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>d', vim.lsp.buf.type_definition, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
