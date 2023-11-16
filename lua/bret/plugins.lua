local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath
  })
end

vim.opt.rtp:prepend(lazypath)

local is_ok, lazy = pcall(require, "lazy")
if not is_ok then
  print("lazy not loaded")
  return
end

lazy.setup({
  spec = LAZY_PLUGIN_SPEC,
})
