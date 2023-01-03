local map = vim.keymap.set

vim.g.mapleader = " "



map("n", "x", '"_x')
map("n", "=", "<C-a>")
map("n", "-", "<C-x>")

map("n", "<C-a>", "ggVG", { silent = true })

map("i", "<M-z>", "<ESC>", { silent = true })

map("n", "<leader>nh", ":nohl<CR>", { silent = true })
map("n", "<leader>x", ":bdelete!<CR>", { silent = true })

map("n", "<TAB>"    , ":BufferLineCycleNext<CR>", { silent = true })
map("n", "<S-TAB>"  , ":BufferLineCyclePrev<CR>", { silent = true })
map("n", "<leader><Left>", ":BufferLineMovePrev<CR>", { silent = true })
map("n", "<leader><Right>", ":BufferLineMoveNext<CR>", { silent = true })

map("n", "<leader>/", ":lua require('Comment.api').toggle.linewise.current()<CR>")
map("v", "<leader>/", ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")

map("n", "gd", vim.lsp.buf.definition)
map("n", "gD", vim.lsp.buf.declaration)
map("n", "gr", vim.lsp.buf.references)
map("n", "gi", vim.lsp.buf.implementation)
map("n", "<C-k>", vim.lsp.buf.signature_help)
map("n", "<leader>ra", vim.lsp.buf.rename)
map("n", "<leader>d", vim.diagnostic.open_float)
map("n", "<M-n>", vim.diagnostic.goto_next)
map("n", "<M-p>", vim.diagnostic.goto_prev)

map("n", "<leader>fb", ":Telescope file_browser<CR>", { silent = true })
map("n", "<leader>ft", ":TodoTelescope<CR>", { silent = true })
map("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true })
map("n", "<leader>fc", ":Telescope grep_string<CR>", { silent = true })

-- map("n", "<C-n>", ":NvimTreeToggle<CR>")
