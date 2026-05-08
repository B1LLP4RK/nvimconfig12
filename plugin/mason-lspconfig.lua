-- dependencies
vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })
vim.pack.add({"https://github.com/mason-org/mason.nvim"})
require("mason").setup()

-- this package automatically calls `vim.lsp.enable` to correct filetypes
vim.pack.add({"https://github.com/mason-org/mason-lspconfig.nvim"})
require("mason-lspconfig").setup()
