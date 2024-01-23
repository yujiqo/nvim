local opt = vim.opt
local g = vim.g


--- disable netrw ---
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1


--- backup ---
opt.backup = false
opt.writebackup = false
opt.swapfile = false


--- cursorline ---
opt.cursorline = true
opt.cursorlineopt = "number"


--- highlights ---
opt.termguicolors = true
opt.winblend = 0
opt.wildoptions = "pum"
opt.pumblend = 0


--- clipboard ---
opt.clipboard:prepend { "unnamed", "unnamedplus" } -- windows
-- opt.clipboard:append { "unnamedplus" } -- unix


--- statusline ---
opt.laststatus = 2
opt.showmode = true
opt.showcmd = true
opt.ruler = true


--- file ---
-- opt.relativenumber = true
-- opt.colorcolumn = { 79 }
opt.number = true
opt.encoding = "utf-8"
opt.scrolloff = 5
opt.wrap = false
opt.signcolumn = "yes:1"
opt.backspace = "indent,eol,start"
opt.fillchars = { eob = " " }


--- indent ---
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.breakindent = true
opt.smartindent = true
opt.expandtab = true
opt.autoindent = true


--- search ---
opt.smartcase = true
opt.ignorecase = true


--- lsp ---
opt.completeopt = "menu,menuone,noselect"


--- disable gitgutter maps ---
g.gitgutter_map_keys = false
