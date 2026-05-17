vim.pack.add({'https://github.com/nvim-treesitter/nvim-treesitter'})
require('nvim-treesitter').install { 'rust', 'javascript', 'zig' , 'python', 'java', 'bash', 'lua', 'markdown', 'html', 'latex', 'yaml'}
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})
