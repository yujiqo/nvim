local opt = vim.opt
local g = vim.g


opt.fillchars:append({eob=' ', fold=' ', foldopen="", foldsep=" ", foldclose=""})
opt.laststatus = 3
opt.showtabline = 2
opt.showmode = false
opt.number = true
opt.relativenumber = true
opt.encoding = "utf-8"
opt.fileformat = "unix"
opt.fileencoding = "utf-8"
opt.scrolloff = 5
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.breakindent = true
opt.smartindent = true
opt.expandtab = true
opt.autoindent = true
opt.wrap = false
opt.smartcase = true
opt.ignorecase = true
opt.termguicolors = true
opt.background = "dark"
opt.clipboard:prepend({"unnamedplus"})
opt.backspace = "indent,eol,start"
opt.completeopt = "menu,menuone,noselect"
opt.signcolumn = "yes:1"
