require("bret.launch")
require("bret.python")
require("bret.options")
require("bret.keymaps")
require("bret.autocommands")

spec "bret.colorscheme"
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

-- load plugins
require("bret.plugins")

