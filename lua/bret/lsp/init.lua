local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("bret.lsp.mason")
require("bret.lsp.handlers").setup()
require("bret.lsp.null-ls")
