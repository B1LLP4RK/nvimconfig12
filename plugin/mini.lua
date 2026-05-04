vim.pack.add({'https://github.com/nvim-mini/mini.nvim'})
MiniFiles = require('mini.files')
MiniFiles.setup()
-- Open directory of current file (in last used state) focused on the file
vim.keymap.set("n", "<leader>fm", function() MiniFiles.open(vim.api.nvim_buf_get_name(0)) end, {desc = "MiniFiles Open"})
vim.keymap.set("n", "<leader>fM", function() MiniFiles.open() end, {desc = "MiniFiles Open"})
