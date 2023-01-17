local opt = vim.opt
local g = vim.g


--- disable netrw ---
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1


--- backup ---
opt.backup = false
opt.writebackup = false
opt.swapfile = false


--- highlights ---
opt.termguicolors = true
opt.winblend = 0
opt.wildoptions = "pum"
opt.pumblend = 5
opt.background = "dark"


--- clipboard ---
opt.clipboard:prepend { "unnamed", "unnamedplus" } -- windows
-- opt.clipboard:append { "unnamedplus" } -- unix


--- statusline ---
opt.laststatus = 2
opt.showmode = false
opt.ruler = false
opt.showcmd = false


--- file ---
opt.number = true
opt.encoding = "utf-8"
opt.fileformat = "unix"
opt.fileencoding = "utf-8"
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


--- neovide ---
if g.neovide then
    opt.guifont = { "agave NF r", ":h20" }

    g.neovide_transparency = 0.9
    g.neovide_remember_window_size = true
    g.neovide_cursor_vfx_mode = "wireframe"
    g.neovide_underline_automatic_scaling = false
end
