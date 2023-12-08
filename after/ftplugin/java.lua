local options = {
  tabstop = 4,
  shiftwidth = 4,
  expandtab = true,
  autoindent = true,
  smarttab = true
}

for k, v in pairs(options) do
  vim.opt[k] = v
end
