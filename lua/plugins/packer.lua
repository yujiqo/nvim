local setup = function(setup_type, setup_name)
    if setup_type == "d" then
        return ('require("%s").setup()'):format(setup_name)
    elseif setup_type == "c" then
        return ('require("plugins.configs").%s()'):format(setup_name)
    end
end

require("packer").startup({
    function(use)
        use { "wbthomason/packer.nvim" }

        --- nvim lua api ---
        use { "folke/neodev.nvim" }


        --- appearance ---
        -- use { "folke/tokyonight.nvim", config=setup("c", "tokyonight") }
        use { "sainnhe/gruvbox-material" }
        use { "kyazdani42/nvim-web-devicons", config=setup("c", "devicons") }
        use { "lewis6991/gitsigns.nvim", config=setup("d", "gitsigns") }
        use { "tamton-aquib/staline.nvim", config=setup("c", "staline") }
        

        --- lsp & autocmp ---
        use { "williamboman/mason.nvim", config=setup("d", "mason") }
        use { "williamboman/mason-lspconfig.nvim", config=setup("c", "lspconfig_w_mason") }
        use { "neovim/nvim-lspconfig", config=setup("c", "lspconfig") }
        use { "L3MON4D3/LuaSnip" }
        use { "hrsh7th/nvim-cmp", after={"LuaSnip"}, config=setup("c", "cmp") }
        use { "hrsh7th/cmp-path", after={"nvim-cmp"} }
        use { "hrsh7th/cmp-nvim-lsp", module="cmp_nvim_lsp", after={"nvim-cmp"} }
        use { "hrsh7th/cmp-buffer", after={"nvim-cmp"} }
        use { "hrsh7th/cmp-emoji", after={"nvim-cmp"} }
        use { "saadparwaiz1/cmp_luasnip", after={"nvim-cmp"} }
        use { "kevinoid/vim-jsonc" }


        --- general ---
        use { "nvim-lua/plenary.nvim" }
        use { "windwp/nvim-autopairs", config=setup("d", "nvim-autopairs") }
        use { "norcalli/nvim-colorizer.lua", config=setup("d", "colorizer") }
        use { "lukas-reineke/indent-blankline.nvim", config=setup("c", "indent_blankline")  }
        use { "numToStr/Comment.nvim", config=setup("d", "Comment") }
        use { "kyazdani42/nvim-tree.lua", config=setup("c", "nvim_tree") }
        use { "nvim-treesitter/nvim-treesitter", config=setup("c", "treesitter") }
        use { "nvim-telescope/telescope.nvim", config=setup("c", "telescope") }
    end
})
