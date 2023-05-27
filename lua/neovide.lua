vim.opt.guifont = { "Iosevka Nerd Font", ":h17" }

vim.g.neovide_transparency = 0.9
vim.g.neovide_scale_factor = 1.0
vim.g.neovide_cursor_vfx_mode = "wireframe"

local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end

vim.keymap.set("n", "<C-=>", function() change_scale_factor(2.25) end)
vim.keymap.set("n", "<C-->", function() change_scale_factor(2/1.25) end)
