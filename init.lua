require("bret.launch")
require("bret.python")
require("bret.options")
require("bret.keymaps")
require("bret.autocommands")

spec "bret.treesitter"
spec "bret.autopairs"
spec "bret.devicons"
spec "bret.indentline"
spec "bret.mason"
spec "bret.schemastore"
spec "bret.lspconfig"
spec "bret.go"
spec "bret.cmp"
spec "bret.telescope"
spec "bret.lualine"
spec "bret.gitsigns"
spec "bret.nvimtree"
spec "bret.whichkey"
spec "bret.comment"
spec "bret.toggleterm"
spec "bret.null-ls"
-- spec "bret.navic"
-- spec "bret.breadcrumbs"
spec "bret.bufferline"
spec "bret.colorizer"

-- colorschemes
spec "bret.colorschemes.onedark"
spec "bret.colorschemes.nord"
spec "bret.colorschemes.gruvbox"

-- plugin development
spec "bret.bubble"

-- load plugins
require("bret.plugins")
