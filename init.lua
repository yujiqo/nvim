--- plugins ---
require("lazy.bootstrap")
require("lazy.setup")

--- general ---
require("options")
require("keymaps")

--- neovide ---
if vim.g.neovide then
    require("neovide")
end
