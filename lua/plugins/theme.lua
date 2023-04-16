local configs = {}


configs.rose_pine = function()
    local rose_pine = require("rose-pine");

    rose_pine.setup {
        variant = "main", -- "main" | "moon" | "dawn"
        bold_vert_split = false,
        dim_nc_background = false,
        disable_background = true,
        disable_float_background = true,
        disable_italics = true,
    }

    vim.cmd[[colorscheme rose-pine]]
end


return configs
