local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system ({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install plugins here
return packer.startup(function(use)
  use { "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" } -- Have packer manage itself
  use { "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" } -- Useful lua functions used by lots of plugins
  use { "folke/which-key.nvim", commit = "61553aeb3d5ca8c11eea8be6eadf478062982ac9" }
  use { "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" }
  use { "akinsho/bufferline.nvim", commit = "83bf4dc7bff642e145c8b4547aa596803a8b4dc4" }
  use { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" }
  -- MarkdownPreview
  use { "iamcco/markdown-preview.nvim", commit = "02cc3874738bc0f86e4b91f09b8a0ac88aef8e96", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, }
  -- Colorizer
  use { "uga-rosa/ccc.nvim", commit = "da5ed534bf401819eb4bc6a78c11c11b8bf3fb65" }

  -- Autopairs
  use { "windwp/nvim-autopairs", commit = "6b6e35fc9aca1030a74cc022220bc22ea6c5daf4" }

  -- Colorschemes
  use { "shaunsingh/nord.nvim", commit = "a6bb6a8b71fdd5329d0ae0fd637e700b12e4a5cb" } -- Nord colorscheme
  use { "ellisonleao/gruvbox.nvim", commit = "5ac400bbd7bbe5d5911a79c45347df6d3afd388e" } -- Gruvbox colorscheme
  use { "navarasu/onedark.nvim", commit = "df090f9d72d43aa51dec5760c44da288b58a79b6" }
  use { "folke/tokyonight.nvim", commit = "62b4e89ea1766baa3b5343ca77d62c817f5f48d0" }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", commit = "8e763332b7bf7b3a426fd8707b7f5aa85823a5ac", }
  use { "p00f/nvim-ts-rainbow", commit = "064fd6c0a15fae7f876c2c6dd4524ca3fad96750" }

  -- TODO: comment
  use { "folke/todo-comments.nvim", commit = "1b9df577262b2c4c4ea422161742927f80ffa131" }
  -- Comments
  use { "numToStr/Comment.nvim", commit = "5f01c1a89adafc52bf34e3bf690f80d9d726715d" }
  use { "JoosepAlviste/nvim-ts-context-commentstring", commit = "4d3a68c41a53add8804f471fcc49bb398fe8de08" }

  -- Web-devicons
  use { "kyazdani42/nvim-web-devicons", commit = "3b1b794bc17b7ac3df3ae471f1c18f18d1a0f958" }

  -- Lualine
  use { "nvim-lualine/lualine.nvim", commit = "3325d5d43a7a2bc9baeef2b7e58e1d915278beaf" }

  -- Nvim-Tree
  use { "nvim-tree/nvim-tree.lua", commit = "1837751efb5fcfc584cb0ee900f09ff911cd6c0b" }

  -- Telescope
  use { "nvim-telescope/telescope.nvim", commit = "7a4ffef931769c3fe7544214ed7ffde5852653f6" }

  -- Golang
  use { "ray-x/guihua.lua" }
  use { "ray-x/go.nvim", commit = "5352d821f12f68840993e877084e5016564377f3" }

  -- CMP
  use { "hrsh7th/nvim-cmp", commit = "b0dff0ec4f2748626aae13f011d1a47071fe9abc" } -- The completion plugin
  use { "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" } -- buffer completions
  use { "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" } -- path completions
	use { "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" } -- snippet completions
	use { "hrsh7th/cmp-nvim-lsp", commit = "3cf38d9c957e95c397b66f91967758b31be4abe6" }
	use { "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }

	-- Snippets
  use { "L3MON4D3/LuaSnip", commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84" } --snippet engine
  use { "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" } -- a bunch of snippets to use

  -- LSP
  use { "neovim/nvim-lspconfig", commit = "f11fdff7e8b5b415e5ef1837bdcdd37ea6764dda" } -- enable LSP
  use { "williamboman/mason.nvim", commit = "c2002d7a6b5a72ba02388548cfaf420b864fbc12"} -- simple to use language server installer
  use { "williamboman/mason-lspconfig.nvim", commit = "0051870dd728f4988110a1b2d47f4a4510213e31" }
	use { "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" } -- for formatters and linters
  use { "RRethy/vim-illuminate", commit = "a2e8476af3f3e993bb0d6477438aad3096512e42" }
  
  -- Copilot
  use { "github/copilot.vim", commit = "5a411d19ce7334ab10ba12516743fc25dad363fa" }

  -- Toggleterm
  use { "akinsho/toggleterm.nvim", commit = "2a787c426ef00cb3488c11b14f5dcf892bbd0bda" }

  -- Gitsigns
  use { "lewis6991/gitsigns.nvim", commit = "2c6f96dda47e55fa07052ce2e2141e8367cbaaf2" }

  -- Notify
  use { "rcarriga/nvim-notify", commit = "43c54aec682854b39a7e0e89b4c3ba00426d74a8" }
  
  -- debug
  use { "mfussenegger/nvim-dap" }
  use { "rcarriga/nvim-dap-ui" }
  use { "leoluz/nvim-dap-go" }
  
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
