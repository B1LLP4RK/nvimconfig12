vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")

vim.keymap.set({ "n", "x", "o" }, "s",   function() require("flash").jump() end, {desc = "Flash"} )
vim.keymap.set({ "n", "x", "o" }, "S",   function() require("flash").treesitter() end, {desc = "Flash Treesitter" })
vim.keymap.set("o", "r",  function() require("flash").remote() end, {desc = "Remote Flash" })
vim.keymap.set({ "o", "x" }, "R",  function() require("flash").treesitter_search() end, {desc = "Treesitter Search"} )
vim.keymap.set({ "c" }, "<c-s>",  function() require("flash").toggle() end, {desc = "Toggle Flash Search"} )

