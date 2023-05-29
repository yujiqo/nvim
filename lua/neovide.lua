vim.o.guifont = "SFMono Nerd Font:h16"

vim.g.neovide_transparency = 0.9
vim.g.neovide_scale_factor = 1.0

local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end

vim.keymap.set("n", "<C-=>", function() change_scale_factor(2.25) end)
vim.keymap.set("n", "<C-->", function() change_scale_factor(2/1.25) end)
