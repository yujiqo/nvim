local configs = {}


configs.catppuccin = function()
    require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        no_italic = true,
        default_integrations = true,
        integrations = {
            cmp = true,
            gitsigns = true,
            treesitter = true,
            mini = {
                enabled = false,
            }
        }
    })

    vim.cmd.colorscheme "catppuccin"
end


configs.komau = function()
    local g = vim.g

    g.komau_italic = 0

    vim.cmd("colorscheme komau")
end


configs.rose_pine = function()
    local rose_pine = require("rose-pine");

    rose_pine.setup {
        bold_vert_split = false,
        dim_nc_background = false,
        disable_background = true,
        disable_float_background = true,
        disable_italics = true,
    }

    vim.cmd("colorscheme rose-pine-main")
end


return configs
