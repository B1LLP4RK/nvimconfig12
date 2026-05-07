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


-- better up/down
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- buffers
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.keymap.set("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
vim.keymap.set("n", "<leader>bd", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>bo", function()
  Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })
vim.keymap.set("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- Clear search and stop snippet on escape
-- vim.keymap.set({ "i", "n", "s" }, "<esc>", function()
--   vim.cmd("noh")
--   LazyVim.cmp.actions.snippet_stop()
--   return "<esc>"
-- end, { expr = true, desc = "Escape and Clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
vim.keymap.set(
  "n",
  "<leader>ur",
  "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
  { desc = "Redraw / Clear hlsearch / Diff Update" }
)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Add undo break-points
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")

-- save file
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

--keywordprg
vim.keymap.set("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- better indenting
vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")

-- commenting
vim.keymap.set("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
vim.keymap.set("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- lazy
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- new file
vim.keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

-- location list
vim.keymap.set("n", "<leader>xl", function()
  local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Location List" })

-- quickfix list
vim.keymap.set("n", "<leader>xq", function()
  local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
  if not success and err then
    vim.notify(err, vim.log.levels.ERROR)
  end
end, { desc = "Quickfix List" })

vim.keymap.set("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
vim.keymap.set("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

-- formatting
-- vim.keymap.set({ "n", "x" }, "<leader>cf", function()
--   LazyVim.format({ force = true })
-- end, { desc = "Format" })

-- diagnostic
local diagnostic_goto = function(next, severity)
  return function()
    vim.diagnostic.jump({
      count = (next and 1 or -1) * vim.v.count1,
      severity = severity and vim.diagnostic.severity[severity] or nil,
      float = true,
    })
  end
end
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
vim.keymap.set("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
vim.keymap.set("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
vim.keymap.set("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
vim.keymap.set("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
vim.keymap.set("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- stylua: ignore start

vim.pack.add({'https://github.com/folke/snacks.nvim'})
Snacks = require("snacks")
-- toggle options
Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
Snacks.toggle.diagnostics():map("<leader>ud")
Snacks.toggle.line_number():map("<leader>ul")
Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "Conceal Level" }):map("<leader>uc")
Snacks.toggle.option("showtabline", { off = 0, on = vim.o.showtabline > 0 and vim.o.showtabline or 2, name = "Tabline" }):map("<leader>uA")
Snacks.toggle.treesitter():map("<leader>uT")
Snacks.toggle.option("background", { off = "light", on = "dark" , name = "Dark Background" }):map("<leader>ub")
Snacks.toggle.dim():map("<leader>uD")
Snacks.toggle.animate():map("<leader>ua")
Snacks.toggle.indent():map("<leader>ug")
Snacks.toggle.scroll():map("<leader>uS")
Snacks.toggle.profiler():map("<leader>dpp")
Snacks.toggle.profiler_highlights():map("<leader>dph")

if vim.lsp.inlay_hint then
  Snacks.toggle.inlay_hints():map("<leader>uh")
end

-- lazygit
-- if vim.fn.executable("lazygit") == 1 then
--   map("n", "<leader>gg", function() Snacks.lazygit( { cwd = LazyVim.root.git() }) end, { desc = "Lazygit (Root Dir)" })
--   map("n", "<leader>gG", function() Snacks.lazygit() end, { desc = "Lazygit (cwd)" })
-- end

vim.keymap.set("n", "<leader>gL", function() Snacks.picker.git_log() end, { desc = "Git Log (cwd)" })
vim.keymap.set("n", "<leader>gb", function() Snacks.picker.git_log_line() end, { desc = "Git Blame Line" })
vim.keymap.set("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git Current File History" })
-- vim.keymap.set("n", "<leader>gl", function() Snacks.picker.git_log({ cwd = LazyVim.root.git() }) end, { desc = "Git Log" })
vim.keymap.set({ "n", "x" }, "<leader>gB", function() Snacks.gitbrowse() end, { desc = "Git Browse (open)" })
vim.keymap.set({"n", "x" }, "<leader>gY", function()
  Snacks.gitbrowse({ open = function(url) vim.fn.setreg("+", url) end, notify = false })
end, { desc = "Git Browse (copy)" })

-- quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- highlights under cursor
vim.keymap.set("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
vim.keymap.set("n", "<leader>uI", function() vim.treesitter.inspect_tree() vim.api.nvim_input("I") end, { desc = "Inspect Tree" })


-- floating terminal
vim.keymap.set("n", "<leader>fT", function() Snacks.terminal() end, { desc = "Terminal (cwd)" })
-- vim.keymap.set("n", "<leader>ft", function() Snacks.terminal(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)" })
-- vim.keymap.set({"n","t"}, "<c-/>",function() Snacks.terminal.focus(nil, { cwd = LazyVim.root() }) end, { desc = "Terminal (Root Dir)" })
-- vim.keymap.set({"n","t"}, "<c-_>",function() Snacks.terminal.focus(nil, { cwd = LazyVim.root() }) end, { desc = "which_key_ignore" })

-- windows
vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
Snacks.toggle.zoom():map("<leader>wm"):map("<leader>uZ")
Snacks.toggle.zen():map("<leader>uz")

-- tabs
vim.keymap.set("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
vim.keymap.set("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
vim.keymap.set("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
vim.keymap.set("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
vim.keymap.set("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
vim.keymap.set("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- lua
Snacks.keymap.set({"n", "x"}, "<localleader>r", function() Snacks.debug.run() end, { desc = "Run Lua", ft = "lua" })

vim.keymap.set( "n", "<leader>,", function() Snacks.picker.buffers() end, { desc = "Buffers" } )
-- vim.keymap.set( "n", "<leader>/", LazyVim.pick("grep"), { desc = "Grep (Root Dir)" } )
vim.keymap.set( "n", "<leader>:", function() Snacks.picker.command_history() end, { desc = "Command History" } )
-- vim.keymap.set( "n", "<leader><space>", LazyVim.pick("files"), { desc = "Find Files (Root Dir)" } )
vim.keymap.set( "n", "<leader>n", function() Snacks.picker.notifications() end, { desc = "Notification History" } )
-- find
vim.keymap.set( "n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Buffers" } )
vim.keymap.set( "n", "<leader>fB", function() Snacks.picker.buffers({ hidden = true, nofile = true }) end, { desc = "Buffers (all)" } )
-- vim.keymap.set( "n", "<leader>fc", LazyVim.pick.config_files(), { desc = "Find Config File" } )
-- vim.keymap.set( "n", "<leader>ff", LazyVim.pick("files"), { desc = "Find Files (Root Dir)" } )
-- vim.keymap.set( "n", "<leader>fF", LazyVim.pick("files", { root = false }), { desc = "Find Files (cwd)" } )
vim.keymap.set( "n", "<leader>fg", function() Snacks.picker.git_files() end, { desc = "Find Files (git-files)" } )
-- vim.keymap.set( "n", "<leader>fr", LazyVim.pick("oldfiles"), { desc = "Recent" } )
vim.keymap.set( "n", "<leader>fR", function() Snacks.picker.recent({ filter = { cwd = true }}) end, { desc = "Recent (cwd)" } )
vim.keymap.set( "n", "<leader>fp", function() Snacks.picker.projects() end, { desc = "Projects" } )
-- git
vim.keymap.set( "n", "<leader>gd", function() Snacks.picker.git_diff() end, { desc = "Git Diff (hunks)" } )
vim.keymap.set( "n", "<leader>gD", function() Snacks.picker.git_diff({ base = "origin", group = true }) end, { desc = "Git Diff (origin)" } )
vim.keymap.set( "n", "<leader>gs", function() Snacks.picker.git_status() end, { desc = "Git Status" } )
vim.keymap.set( "n", "<leader>gS", function() Snacks.picker.git_stash() end, { desc = "Git Stash" } )
vim.keymap.set( "n", "<leader>gi", function() Snacks.picker.gh_issue() end, { desc = "GitHub Issues (open)" } )
vim.keymap.set( "n", "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, { desc = "GitHub Issues (all)" } )
vim.keymap.set( "n", "<leader>gp", function() Snacks.picker.gh_pr() end, { desc = "GitHub Pull Requests (open)" } )
vim.keymap.set( "n", "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end, { desc = "GitHub Pull Requests (all)" } )
-- Grep
vim.keymap.set( "n", "<leader>sb", function() Snacks.picker.lines() end, { desc = "Buffer Lines" } )
vim.keymap.set( "n", "<leader>sB", function() Snacks.picker.grep_buffers() end, { desc = "Grep Open Buffers" } )
-- vim.keymap.set( "n", "<leader>sg", LazyVim.pick("live_grep"), { desc = "Grep (Root Dir)" } )
-- vim.keymap.set( "n", "<leader>sG", LazyVim.pick("live_grep", { root = false }), { desc = "Grep (cwd)" } )
vim.keymap.set( "n", "<leader>sp", function() Snacks.picker.lazy() end, { desc = "Search for Plugin Spec" } )
-- vim.keymap.set( { "n", "x" }, "<leader>sw", LazyVim.pick("grep_word"), { desc = "Visual selection or word (Root Dir)" },  )
-- vim.keymap.set( { "n", "x" }, "<leader>sW", LazyVim.pick("grep_word", { root = false }), { desc = "Visual selection or word (cwd)" },  )
-- search
vim.keymap.set( "n", '<leader>s"', function() Snacks.picker.registers() end, { desc = "Registers" } )
vim.keymap.set( "n", '<leader>s/', function() Snacks.picker.search_history() end, { desc = "Search History" } )
vim.keymap.set( "n", "<leader>sa", function() Snacks.picker.autocmds() end, { desc = "Autocmds" } )
vim.keymap.set( "n", "<leader>sc", function() Snacks.picker.command_history() end, { desc = "Command History" } )
vim.keymap.set( "n", "<leader>sC", function() Snacks.picker.commands() end, { desc = "Commands" } )
vim.keymap.set( "n", "<leader>sd", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" } )
vim.keymap.set( "n", "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, { desc = "Buffer Diagnostics" } )
vim.keymap.set( "n", "<leader>sh", function() Snacks.picker.help() end, { desc = "Help Pages" } )
vim.keymap.set( "n", "<leader>sH", function() Snacks.picker.highlights() end, { desc = "Highlights" } )
vim.keymap.set( "n", "<leader>si", function() Snacks.picker.icons() end, { desc = "Icons" } )
vim.keymap.set( "n", "<leader>sj", function() Snacks.picker.jumps() end, { desc = "Jumps" } )
vim.keymap.set( "n", "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" } )
vim.keymap.set( "n", "<leader>sl", function() Snacks.picker.loclist() end, { desc = "Location List" } )
vim.keymap.set( "n", "<leader>sM", function() Snacks.picker.man() end, { desc = "Man Pages" } )
vim.keymap.set( "n", "<leader>sm", function() Snacks.picker.marks() end, { desc = "Marks" } )
vim.keymap.set( "n", "<leader>sR", function() Snacks.picker.resume() end, { desc = "Resume" } )
vim.keymap.set( "n", "<leader>sq", function() Snacks.picker.qflist() end, { desc = "Quickfix List" } )
vim.keymap.set( "n", "<leader>su", function() Snacks.picker.undo() end, { desc = "Undotree" } )
-- ui
vim.keymap.set( "n", "<leader>uc", function() snacks.picker.colorschemes() end, { desc = "colorschemes" } )

vim.keymap.set("n", "<leader>cl", function() Snacks.picker.lsp_config() end, { desc = "Lsp Info" } )
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition",  } )
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "References", nowait = true}  )

vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { desc = "Goto Implementation" } )

vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { desc = "Goto T[y]pe Definition" } )
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto Declaration" } )
vim.keymap.set("n", "K", function() return vim.lsp.buf.hover() end, { desc = "Hover" } )
vim.keymap.set("n", "gK", function() return vim.lsp.buf.signature_help() end, { desc = "Signature Help",  } )
vim.keymap.set("i", "<c-k>", function() return vim.lsp.buf.signature_help() end,  { desc = "Signature Help",  } )
vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action",   } )
vim.keymap.set({ "n", "x" }, "<leader>cc", vim.lsp.codelens.run, { desc = "Run Codelens", } )
vim.keymap.set("n", "<leader>cC", vim.lsp.codelens.refresh, { desc = "Refresh & Display Codelens",   } )
vim.keymap.set("n", "<leader>cR", function() Snacks.rename.rename_file() end, { desc = "Rename File"  } )
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename",  } )
-- vim.keymap.set("n", "<leader>cA", LazyVim.lsp.action.source, { desc = "Source Action",  } )
vim.keymap.set("n", "]]", function() Snacks.words.jump(vim.v.count1) end, 
{ desc = "Next Reference" }  )
vim.keymap.set("n", "[[", function() Snacks.words.jump(-vim.v.count1) end,
{ desc = "Prev Reference" }  )
vim.keymap.set("n", "<a-n>", function() Snacks.words.jump(vim.v.count1, true) end, 
{ desc = "Next Reference" }  )
-- vim.keymap.set("n", "<a-p>", function() Snacks.words.jump(-vim.v.count1, true) end,
-- { desc = "Prev Reference" }  )
-- vim.keymap.set("n",
-- "<leader>co",
-- LazyVim.lsp.action["source.organizeImports"],
-- { desc = "Organize Imports" }
-- )
