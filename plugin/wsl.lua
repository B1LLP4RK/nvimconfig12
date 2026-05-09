-- WSL clipboard setup
vim.g.clipboard = {
  name = "WslClipboard",
  copy = {
    ["+"] = "clip.exe",
    ["*"] = "clip.exe",
  },
  paste = {
    ["+"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    ["*"] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  },
  cache_enabled = 0,
}
vim.opt.clipboard:append({ "unnamedplus" })


-- python lsp issue fix

vim.pack.add({ 'https://github.com/neovim/nvim-lspconfig' })
vim.pack.add({"https://github.com/mason-org/mason.nvim"})
require("mason").setup()
-- this package automatically calls `vim.lsp.enable` to correct filetypes
vim.pack.add({"https://github.com/mason-org/mason-lspconfig.nvim"})
require("mason-lspconfig").setup()
local mason_path = vim.fn.stdpath("data") .. "/mason"
local pyright_langserver = mason_path .. "/packages/pyright/node_modules/pyright/langserver.index.js"
vim.lsp.config("pyright", {
  cmd = { "node", pyright_langserver, "--stdio" },
})
