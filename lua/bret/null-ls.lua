local M = {
  "nvimtools/none-ls.nvim"
}

function M.config()
  local null_ls = require("null-ls")

  local formatting = null_ls.builtins.formatting

  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
  null_ls.setup({
    sources = {
      formatting.black,
      formatting.isort,
      formatting.prettier.with({
        filetypes = { "html", "json", "yaml", "markdown", "gohtmltmpl" }
      }),
    },
    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds( { group = augroup , buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ async = false })
          end
        })
      end
    end
  })
end

return M
