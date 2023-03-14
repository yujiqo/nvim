local configs = {}


configs.gruvbox_material = function()
    local g = vim.g

    g.gruvbox_material_background = "hard"
    g.gruvbox_material_foreground = "hard"
    g.gruvbox_material_enable_bold = 1
    g.gruvbox_material_dim_inactive_windows = 1
    g.gruvbox_material_visual = "grey background"
    g.gruvbox_material_ui_contrast = "low"

    vim.cmd[[colorscheme gruvbox-material]]
end


configs.rose_pine = function()
    local rose_pine = require("rose-pine");

    rose_pine.setup {
        dark_variant = "main",
        bold_vert_split = false,
        dim_nc_background = false,
        disable_background = true,
        disable_float_background = true,
        disable_italics = true,
    }

    vim.cmd[[colorscheme rose-pine]]
end


return configs
