vim.pack.add({'https://github.com/nvim-mini/mini.nvim'})
MiniFiles = require('mini.files')
MiniFiles.setup()
vim.keymap.set("n", "<leader>fm", function() MiniFiles.open() end, {desc = "MiniFiles Open"})
