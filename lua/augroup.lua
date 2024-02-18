local create_augroups = require("utils").create_augroups


create_augroups({
    terminal = {
        { "TermOpen", "*", "startinsert" },
        { "TermOpen", "*", "setlocal listchars= nonumber norelativenumber" }
    }
})
