local map = vim.keymap.set

vim.g.mapleader = " "


map("n", "x", '"_x')
map("n", "X", '"_X')
map("n", "<C-a>", "ggVG")
map("n", "<leader>=", "ggVG=gg")

map("i", "<C-j>", "<Up>")
map("i", "<C-k>", "<Down>")
map("i", "<C-h>", "<Left>")
map("i", "<C-l>", "<Right>")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "=", "<C-a>")
map("n", "-", "<C-x>")

map("n", "'", ":set rnu!<CR>", { silent = true })

map("n", "<leader>nh", ":nohl<CR>", { silent = true })

map("n", "<leader>te", ":tabedit<CR>", { silent = true })
map("n", "<leader>h", ":tabmove -<CR>", { silent = true })
map("n", "<leader><Left>", ":tabmove -<CR>", { silent = true })
map("n", "<leader>l", ":tabmove +<CR>", { silent = true })
map("n", "<leader><Right>", ":tabmove +<CR>", { silent = true })
map("n", "<TAB>", ":BufferLineCycleNext<CR>", { silent = true })
map("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", { silent = true })

map("n", "<leader>sg", ":Gitsigns diffthis<CR>", { silent = true })

map("n", "<leader>sv", "<C-w>v<C-w>w")
map("n", "<leader>sh", "<C-w>s<C-w>w")
map("n", "<leader>s<left>", "<C-w><")
map("n", "<leader>s<right>", "<C-w>>")
map("n", "<leader>s<up>", "<C-w>+")
map("n", "<leader>s<down>", "<C-w>-")
map("n", "<leader>sm", ":MaximizerToggle<CR>", { silent = true })

map("n", "<leader>/", ":lua require('Comment.api').toggle.linewise.current()<CR>", { silent = true })
map("v", "<leader>/", ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { silent = true })

map("n","gd", vim.lsp.buf.definition)
map("n","gt", vim.lsp.buf.type_definition)
map("n", "K", vim.lsp.buf.signature_help)
map("n", "gr", '<cmd>lua require("cosmic-ui").rename()<CR>')
map("n", "<leader>sf", vim.diagnostic.open_float)
map("n", "[e", vim.diagnostic.goto_prev)
map("n", "]e", vim.diagnostic.goto_next)

map("n", "<leader>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { silent = true })
map("n", "<leader>ft", ":TodoTelescope<CR>", { silent = true })
map("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true })
map("n", "<leader>fs", ":Telescope grep_string<CR>", { silent = true })

map("n", "<leader>z", ":ZenMode<CR>", { silent = true })
