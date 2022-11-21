local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup({
  ensure_installed = { "go", "python", "javascript", "yaml", "markdown", "markdown_inline" },
  ignore_installed = { "phpdoc" },
  highlight = {
    enable = true,
    disable = { "css" },
  },
  -- TODO: Check on this to see if you still like it
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  autopairs = {
    enable = true,
  },
  indent = { enable = true, disable = { "python", "css" } },
})
