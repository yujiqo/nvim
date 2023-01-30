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


configs.gruvbox = function()
    local gruvbox = require("gruvbox");

    gruvbox.setup {
        undercurl = true,
        underline = true,
        bold = true,
        italic = false,
        strikethrough = false,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = false,
        overrides = {
            GruvboxRedSign = { bg = "none" },
            GruvboxGreenSign = { bg = "none" },
            GruvboxYellowSign = { bg = "none" },
            GruvboxBlueSign = { bg = "none" },
            GruvboxPurpleSign = { bg = "none" },
            GruvboxAquaSign = { bg = "none" },
            GruvboxOrangeSign = { bg = "none" }
        },
        contrast = "hard",
        dim_inactive = false,
        transparent_mode = false,
    }

    vim.cmd[[colorscheme gruvbox]]
end


return configs
