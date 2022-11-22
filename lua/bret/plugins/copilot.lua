vim.g.copilot_no_tab_map = true
vim.g.copilot_no_default_key_mappings = true

-- Enable copilot for certain filetypes
local ftypes = {}
ftypes["go"] = true
ftypes["python"] = true
ftypes["dap-repl"] = false

vim.g.copilot_filetypes = ftypes
vim.cmd[[imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")]]
