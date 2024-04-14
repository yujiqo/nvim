local create_augroups = require("utils").create_augroups


create_augroups({
    terminal = {
        { "TermOpen", "*", "startinsert" },
        { "TermOpen", "*", "setlocal listchars= nonumber norelativenumber" }
    },
    transparent_signs = {
        { "BufEnter", "*", "highlight GitSignsAdd guibg=NONE" },
        { "BufEnter", "*", "highlight GitSignsChange guibg=NONE" },
        { "BufEnter", "*", "highlight GitSignsDelete guibg=NONE" }
    }
})
