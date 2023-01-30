local setup_plugin = function(setup_type, setup_name)
    if setup_type == "d" then
        return ('require("%s").setup()'):format(setup_name)
    elseif setup_type == "c" then
        return ('require("plugins.configs").%s()'):format(setup_name)
    end
end


local setup_theme = function(setup_type, setup_name)
    if setup_type == "d" then
        return ('vim.cmd[[colorscheme %s]]'):format(setup_name)
    elseif setup_type == "c" then
        return ('require("themes.configs").%s()'):format(setup_name)
    end
end


require("packer").startup({
    function(use)
        use { "wbthomason/packer.nvim" }


        --- nvim lua api ---
        use { "folke/neodev.nvim" }


        --- themes ---
        use { "sainnhe/gruvbox-material", config=setup_theme("c", "gruvbox_material") }
        -- use { "ellisonleao/gruvbox.nvim", config=setup_theme("c", "gruvbox") }
        -- use { "lunarvim/horizon.nvim", config=setup_theme("d", "horizon") }


        --- appearance ---
        use { "xiyaowong/nvim-transparent", config=setup_plugin("c", "transparent") }
        use { "kyazdani42/nvim-web-devicons", config=setup_plugin("c", "devicons") }
        use { "tamton-aquib/staline.nvim", config=setup_plugin("c", "staline") }
        use { "lewis6991/gitsigns.nvim", config=setup_plugin("d", "gitsigns") }


        --- general ---
        use { "nvim-lua/plenary.nvim" }
        use { "cappyzawa/trim.nvim", config=setup_plugin("d", "trim") }
        use { "norcalli/nvim-colorizer.lua", config=setup_plugin("d", "colorizer") }
        use { "numToStr/Comment.nvim", config=setup_plugin("d", "Comment") }
        use { "folke/todo-comments.nvim", config=setup_plugin("c", "todo_comments") }
        use { "akinsho/bufferline.nvim", config=setup_plugin("c", "bufferline") }
        use { "nvim-treesitter/nvim-treesitter", config=setup_plugin("c", "treesitter") }
        use { "nvim-telescope/telescope.nvim", config=setup_plugin("c", "telescope") }
        use { "nvim-telescope/telescope-file-browser.nvim" }


        --- lsp & autocmp ---
        use { "williamboman/mason.nvim", config=setup_plugin("d", "mason") }
        use { "williamboman/mason-lspconfig.nvim", config=setup_plugin("c", "lspconfig_w_mason") }
        use { "neovim/nvim-lspconfig", config=setup_plugin("c", "lspconfig") }
        use { "L3MON4D3/LuaSnip" }
        use { "hrsh7th/nvim-cmp", after={"LuaSnip"}, config=setup_plugin("c", "cmp") }
        use { "hrsh7th/cmp-path", after={"nvim-cmp"} }
        use { "hrsh7th/cmp-nvim-lsp", module="cmp_nvim_lsp", after={"nvim-cmp"} }
        use { "hrsh7th/cmp-buffer", after={"nvim-cmp"} }
        use { "hrsh7th/cmp-nvim-lsp-signature-help", after={"nvim-cmp"} }
        use { "saadparwaiz1/cmp_luasnip", after={"nvim-cmp"} }
        use { "kevinoid/vim-jsonc" }
        use { "neoclide/vim-jsx-improve" }
    end
})
