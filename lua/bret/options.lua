local options = {
	backup = false,
	clipboard = "unnamedplus",
	cmdheight = 2,
	completeopt = { "menuone", "noselect" },
	conceallevel = 0,
	fileencoding = "utf-8",
	hlsearch = true,
	ignorecase = true,
	mouse = "a",
	pumheight = 10,
	showmode = false,
	showtabline = 2,
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	-- termguicolors = false,
	timeoutlen = 300,
	undofile = true,
	updatetime = 300,
	writebackup = false,
	expandtab = true,
	shiftwidth = 2,
	tabstop = 2,
	cursorline = true,
	number = true,
	relativenumber = true,
	numberwidth = 4,
	signcolumn = "yes",
	wrap = true,
	linebreak = true,
	scrolloff = 8,
	sidescrolloff = 8,
	guifont = "monospace:h17",
	whichwrap = "bs<>[]hl",
	laststatus = 3,
	foldlevel = 20,
-- 	foldmethod = "expr",
-- 	foldexpr = "nvim_treesitter#foldexpr()",
	foldcolumn = "3",
}

vim.g.clipboard = {
 name = "xsel",
 copy = {
  ["+"] = "xsel --nodetach -i -b",
  ["*"] = "xsel --nodetach -i -p",
 },
 paste = {
  ["+"] = "xsel  -o -b",
  ["*"] = "xsel  -o -b",
 },
 cache_enabled = 1,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- tscomment string
vim.g.skip_ts_context_commentstring_module = true

-- vim.opt.shortmess:append("c")
-- vim.opt.iskeyword:append("-")
-- vim.opt.formatoptions:remove({ "c", "r", "o" })
-- vim.opt.runtimepath:remove("/usr/share/vim/vimfiles")
