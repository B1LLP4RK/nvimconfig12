vim.pack.add({'https://github.com/nvim-mini/mini.nvim'})
MiniFiles = require('mini.files')
MiniFiles.setup()
-- Open directory of current file (in last used state) focused on the file
vim.keymap.set("n", "<leader>fm", function() MiniFiles.open(vim.api.nvim_buf_get_name(0)) end, {desc = "MiniFiles Open"})
vim.keymap.set("n", "<leader>fM", function() MiniFiles.open() end, {desc = "MiniFiles Open"})
vim.keymap.set("n", "<leader>fd", function() MiniFiles.open(vim.fn.stdpath("data")) end, {desc = "data dir Open"})

MiniPairs = require('mini.pairs')
MiniPairs.setup(
	{  modes = { insert = true, command = true, terminal = false },
	-- skip autopair when next character is one of these
	skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
	-- skip autopair when the cursor is inside these treesitter nodes
	skip_ts = { "string" },
	-- skip autopair when next character is closing pair
	-- and there are more closing pairs than opening pairs
	skip_unbalanced = true,
	-- better deal with markdown code blocks
	markdown = true,}
)
