 -- Set mappings to be similar to Nvim-R
vim.g.cmdline_map_start          = '<LocalLeader>s'
vim.g.cmdline_map_send           = '<LocalLeader>d'
vim.g.cmdline_map_send_and_stay  = '<LocalLeader>l'
vim.g.cmdline_map_source_fun     = '<LocalLeader>fe'
vim.g.cmdline_map_send_paragraph = '<LocalLeader>pe'
vim.g.cmdline_map_send_block     = '<LocalLeader>be'
vim.g.cmdline_map_send_motion    = '<LocalLeader>m'
vim.g.cmdline_map_quit           = '<LocalLeader>q'

-- Don't use the neovim terminal
vim.g.cmdline_in_buffer = 0
vim.g.cmdline_external_term_cmd = 'kitty %s &'
vim.g.cmdline_tmux_conf = "~/.tmux.conf"
