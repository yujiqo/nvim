local map = vim.keymap.set

vim.g.mapleader = " "


map("n", "x", '"_x')

map("n", "<C-a>", "ggVG")
map("i", "jk", "<ESC>")

map("n", "=", "<C-a>")
map("n", "-", "<C-x>")

map("n", "<leader>nh", ":nohl<CR>", { silent = true })

map("n", "te", ":tabedit<CR>", { silent = true })
map("n", "th", ":tabmove -<CR>", { silent = true })
map("n", "t<Left>", ":tabmove -<CR>", { silent = true })
map("n", "tl", ":tabmove +<CR>", { silent = true })
map("n", "t<Right>", ":tabmove +<CR>", { silent = true })
map("n", "<TAB>", ":BufferLineCycleNext<CR>", { silent = true })
map("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", { silent = true })

map("n", "sv", "<C-w>v<C-w>w")
map("n", "sh", "<C-w>s<C-w>w")
map("n", "s<left>", "<C-w><")
map("n", "s<right>", "<C-w>>")
map("n", "s<up>", "<C-w>+")
map("n", "s<down>", "<C-w>-")
map("n", "sm", ":MaximizerToggle<CR>", { silent = true })

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
