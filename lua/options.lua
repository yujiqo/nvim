local opt = vim.opt
local g = vim.g

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.gitgutter_map_keys = false

opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.encoding = "utf-8"
opt.scrolloff = 0
opt.wrap = false
opt.smartcase = true
opt.ignorecase = true
opt.completeopt = "menu,menuone,noselect"

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.breakindent = true
opt.smartindent = true
opt.expandtab = true
opt.autoindent = true

opt.termguicolors = true
opt.winblend = 0
opt.wildoptions = "pum"
opt.pumblend = 0
opt.cursorline = true
opt.cursorlineopt = "number"
opt.laststatus = 2
opt.showmode = false
opt.showcmd = false
opt.ruler = false
opt.number = true
opt.signcolumn = "yes:1"
opt.backspace = "indent,eol,start"
opt.fillchars = { eob = " " }

opt.clipboard:prepend { "unnamed", "unnamedplus" } -- windows
-- opt.clipboard:append { "unnamedplus" } -- unix
