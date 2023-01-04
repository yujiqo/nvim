local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--single-branch",
        "https://github.com/folke/lazy.nvim.git",
        lazypath,
    })
end

vim.opt.runtimepath:prepend(lazypath)



local setup = function(setup_type, setup_name)
    if setup_type == "d" then
        return function()
            loadstring(('require("%s").setup()'):format(setup_name))()
        end
    elseif setup_type == "c" then
        return function()
            loadstring(('require("plugins.configs").%s()'):format(setup_name))()
        end
    end
end


require("lazy").setup({
    --- appearance ---
    { "ellisonleao/gruvbox.nvim", config=setup("c", "gruvbox") },
    { "glepnir/dashboard-nvim", config=setup("c", "dashboard") },
    { "xiyaowong/nvim-transparent", config=setup("c", "transparent") },
    { "kyazdani42/nvim-web-devicons", config=setup("c", "devicons") },
    { "tamton-aquib/staline.nvim", config=setup("c", "staline") },
    { "lewis6991/gitsigns.nvim", config=setup("d", "gitsigns") },


    --- general ---
    { "nvim-lua/plenary.nvim" },
    { "cappyzawa/trim.nvim", config=setup("d", "trim") },
    { "windwp/nvim-autopairs", config=setup("d", "nvim-autopairs") },
    { "norcalli/nvim-colorizer.lua", config=setup("d", "colorizer") },
    { "numToStr/Comment.nvim", config=setup("d", "Comment") },
    { "lukas-reineke/indent-blankline.nvim", config=setup("c", "indent_blankline") },
    { "folke/todo-comments.nvim", config=setup("c", "todo_comments") },
    { "akinsho/bufferline.nvim", config=setup("c", "bufferline") },
    { "nvim-treesitter/nvim-treesitter", config=setup("c", "treesitter") },
    { "nvim-telescope/telescope.nvim", config=setup("c", "telescope"), lazy=true, cmd="Telescope" },
    { "nvim-telescope/telescope-file-browser.nvim", lazy=true, cmd="Telescope" },


    --- lsp & autocmp ---
    { "williamboman/mason.nvim", config=setup("d", "mason"), lazy=true, cmd="Mason" },
    { "williamboman/mason-lspconfig.nvim", config=setup("c", "lspconfig_w_mason") },
    { "neovim/nvim-lspconfig", config=setup("c", "lspconfig") },
    { "hrsh7th/nvim-cmp", config=setup("c", "cmp") },
    { "L3MON4D3/LuaSnip" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    { "saadparwaiz1/cmp_luasnip" },
    { "kevinoid/vim-jsonc" },
    { "neoclide/vim-jsx-improve" }


    --- maybe later ---
    -- { "nvim-tree/nvim-tree.lua", config=setup("c", "nvim_tree"), lazy=true, keys = { { "<C-n>", ":NvimTreeToggle<CR>" } } },
})
