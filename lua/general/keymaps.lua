local map = vim.keymap.set

vim.g.mapleader = " "


map("n", "x", '"_x')

map("n", "<C-a>", "ggVG")
map("i", "jk", "<ESC>")

map("n", "<leader>=", "<C-a>")
map("n", "<leader>-", "<C-x>")

map("n", "<leader>sv", "<C-w>v")
map("n", "<leader>sh", "<C-w>s")
map("n", "<leader>se", "<C-w>=")
map("n", "<leader>sx", ":close<CR>", { silent = true })
map("n", "<leader>sm", ":MaximizerToggle<CR>", { silent = true })

map("n", "<leader>nh", ":nohl<CR>", { silent = true })
map("n", "<leader>x", ":bdelete!<CR>", { silent = true })

map("n", "<TAB>"    , ":BufferLineCycleNext<CR>", { silent = true })
map("n", "<S-TAB>"  , ":BufferLineCyclePrev<CR>", { silent = true })
map("n", "<leader>h", ":BufferLineMovePrev<CR>", { silent = true })
map("n", "<leader><Left>", ":BufferLineMovePrev<CR>", { silent = true })
map("n", "<leader>l", ":BufferLineMoveNext<CR>", { silent = true })
map("n", "<leader><Right>", ":BufferLineMoveNext<CR>", { silent = true })

map("n", "<leader>/", ":lua require('Comment.api').toggle.linewise.current()<CR>")
map("v", "<leader>/", ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")

map("n","gd", vim.lsp.buf.definition)
map("n", "K", vim.lsp.buf.signature_help)
map("n", "gr", vim.lsp.buf.rename)
map("n", "<leader>sf", vim.diagnostic.open_float)
map("n", "[e", vim.diagnostic.goto_prev)
map("n", "]e", vim.diagnostic.goto_next)

map("n", "<leader>fb", ":Telescope file_browser<CR>", { silent = true })
map("n", "<leader>ft", ":TodoTelescope<CR>", { silent = true })
map("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true })
map("n", "<leader>fc", ":Telescope grep_string<CR>", { silent = true })

-- map("n", "<C-n>", ":NvimTreeToggle<CR>")
