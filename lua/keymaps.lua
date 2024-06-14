local map = vim.keymap.set

vim.g.mapleader = " "

map("n", "<C-a>", "ggVG")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<leader>nh", ":nohl<CR>", { silent = true })

map("n", "x", '"_x')
map("n", "X", '"_X')
map("n", "=", "<C-a>")
map("n", "-", "<C-x>")

map("n", ";", ":!")
map("n", "'", ":set rnu!<CR>", { silent = true })

map("n", "<leader>c", ":bd<CR>", { silent = true })
map("n", "<leader>te", ":tabedit<CR>", { silent = true })
map("n", "<leader>h", ":tabmove -<CR>", { silent = true })
map("n", "<leader>l", ":tabmove +<CR>", { silent = true })
map("n", "<TAB>", ":tabnext<CR>", { silent = true })
map("n", "<S-TAB>", ":tabprev<CR>", { silent = true })

map("n", "<leader>sv", "<C-w>v<C-w>w")
map("n", "<leader>sh", "<C-w>s<C-w>w")
map("n", "<leader>s<left>", "<C-w><")
map("n", "<leader>s<right>", "<C-w>>")
map("n", "<leader>s<up>", "<C-w>+")
map("n", "<leader>s<down>", "<C-w>-")
map("n", "<leader>sm", ":MaximizerToggle<CR>", { silent = true })

if vim.fn.has "nvim" == 1 then
  map("n", "<BS>", "<C-w>h", { silent = true})
else
  map("n", "<C-h>", "<C-w>h", { silent = true})
end
map("n", "<C-j>", "<C-w>j", { silent = true})
map("n", "<C-k>", "<C-w>k", { silent = true})
map("n", "<C-l>", "<C-w>l", { silent = true})

map("n", "<leader>sg", ":Gitsigns diffthis<CR>", { silent = true })

map("n", "<leader>/", ":lua require('Comment.api').toggle.linewise.current()<CR>", { silent = true })
map("v", "<leader>/", ":lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", { silent = true })

map("n", "<leader>b", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", { silent = true })
map("n", "<leader>fb", ":Telescope buffers<CR>", { silent = true })
map("n", "<leader>ft", ":TodoTelescope<CR>", { silent = true })
map("n", "<leader>ff", ":Telescope find_files<CR>", { silent = true })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { silent = true })
map("n", "<leader>fs", ":Telescope grep_string<CR>", { silent = true })

map("n", "<leader>z", ":ZenMode<CR>", { silent = true })
