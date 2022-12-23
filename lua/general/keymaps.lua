vim.g.mapleader = " "

local map = vim.keymap.set


map("n", "<ESC>", ":nohl<CR>", { silent = true })
map("i", "<M-z>", "<ESC>", { silent = true })
map("n", "<leader>a", "ggVG", { silent = true })
map("n", "<TAB>"    , ":bnext<CR>", { silent = true })
map("n", "<S-TAB>"  , ":bprevious<CR>", { silent = true })
map("n", "<leader>x", ":bdelete<CR>", { silent = true })

map("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })

map("n", "gd", vim.lsp.buf.definition)
map("n", "gD", vim.lsp.buf.declaration)
map("n", "gr", vim.lsp.buf.references)
map("n", "gi", vim.lsp.buf.implementation)
map("n", "<leader>ra", vim.lsp.buf.rename)
map("n", "<leader>do", vim.diagnostic.open_float)
map("n", "<M-n>", vim.diagnostic.goto_next)
map("n", "<M-p>", vim.diagnostic.goto_prev)

map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>")
map("n", "<leader>fc", "<cmd>Telescope grep_string<CR>")
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
