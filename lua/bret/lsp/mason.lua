local servers = {
  "jsonls",
  "gopls",
  -- "yamlls",
  "emmet_ls",
  "tailwindcss",
}

local settings = {
  ui = {
    border = "none",
    icons = {
      package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("bret.lsp.handlers").on_attach,
    capabilities = require("bret.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]

  if server == "jsonls" then
    local jsonls_opts = {
        init_options = {
          provideFormatter = false,
        },
        settings = {
         json = {
           schemas = require("schemastore").json.schemas(),
           validate = { enable = true},
          },
        },
        setup = {
          commands = {
            -- Format = {
            --   function()
            --     vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
            --   end,
            -- },
          },
        },
    }
    opts = vim.tbl_deep_extend("force", opts, jsonls_opts)
  else
    local require_ok, conf_opts = pcall(require, "bret.lsp.settings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end
  end

  lspconfig[server].setup(opts)
end

-- Language: yamlls
lspconfig["yamlls"].setup(
  {
    opts.on_attach,
    opts.capabilities,
    settings = {
      yaml = {
        schemaStore = {
          enable = true,
          url = "https://www.schemastore.org/api/json/catalog.json",
        },
        schemas = {
          ["https://json.schemastore.org/github-workflow"] = ".github/workflows/*.yml",
          ["https://json.schemastore.org/hugo.json"] = "config.yaml",
        },
      },
    },
  }
)

