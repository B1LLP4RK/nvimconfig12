-- syncs tmux clipboard with nvim
-- if using windows terminal from Windows 11 to ssh to a server to use tmux with nvim add 
-- setw -g mode-keys vi
-- set -g set-clipboard on
-- to .tmux.conf

vim.opt.clipboard:append("unnamedplus")
vim.g.clipboard = "tmux"

-- below settings are for valid color expression of nvim in tmux.
-- add below to .tmux.conf
-- set -g default-terminal "screen-256color"
-- set-option -ga terminal-overrides ",xterm-256color:Tc"
vim.opt.termguicolors = true
