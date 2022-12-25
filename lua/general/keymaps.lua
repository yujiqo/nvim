vim.g.mapleader = " "

local map = vim.keymap.set


map("n", "<ESC>", ":nohl<CR>", { silent = true })
map("i", "<M-z>", "<ESC>", { silent = true })
map("n", "<C-a>", "ggVG", { silent = true })
map("n", "<TAB>"    , ":bnext<CR>", { silent = true })
map("n", "<S-TAB>"  , ":bprevious<CR>", { silent = true })
map("n", "<leader>x", ":bdelete!<CR>", { silent = true })
map("n", "<leader><Left>", ":BufferLineMovePrev<CR>", { silent = true })
map("n", "<leader><Right>", ":BufferLineMoveNext<CR>", { silent = true })
map("n", "<leader>/", ":lua require('Comment.api').toggle.linewise.current()<CR>")
map("v", "<leader>/", ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")

map("n", "<C-n>", ":NvimTreeToggle<CR>")

map("n", "gd", vim.lsp.buf.definition)
map("n", "gD", vim.lsp.buf.declaration)
map("n", "gr", vim.lsp.buf.references)
map("n", "gi", vim.lsp.buf.implementation)
map("n", "<C-k>", vim.lsp.buf.signature_help)
map("n", "<leader>ra", vim.lsp.buf.rename)
map("n", "<leader>f", vim.diagnostic.open_float)
map("n", "<M-n>", vim.diagnostic.goto_next)
map("n", "<M-p>", vim.diagnostic.goto_prev)

map("n", "<leader>ft", ":TodoTelescope <CR>", { silent = true })
map("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true })
map("n", "<leader>fc", ":Telescope grep_string<CR>", { silent = true })
map("n", "<leader>fb", ":Telescope buffers<CR>", { silent = true })
map("n", "<leader>fh", ":Telescope help_tags<CR>", { silent = true })
