vim.g.copilot_no_tab_map = true
vim.g.copilot_no_default_key_mappings = true

vim.cmd[[imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")]]
