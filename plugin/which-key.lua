--which-key
vim.pack.add({'https://github.com/folke/which-key.nvim'})
WhichKey = require('which-key')
-- which-key dependencies
vim.pack.add({'https://github.com/nvim-mini/mini.nvim'})
require('mini.icons').setup()
vim.pack.add({'https://github.com/nvim-tree/nvim-web-devicons'})
require('nvim-web-devicons').setup()

vim.keymap.set("n",
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      {desc = "Buffer Local Keymaps (which-key)"})
WhichKey.setup({preset = "helix"})
