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
        -- use { "sainnhe/gruvbox-material" }
        use { "folke/tokyonight.nvim", config=setup("c", "tokyonight") }
        use { "glepnir/dashboard-nvim", config=setup("c", "dashboard") }
        use { "xiyaowong/nvim-transparent", config=setup("c", "transparent") }
        use { "kyazdani42/nvim-web-devicons", config=setup("c", "devicons") }
        use { "tamton-aquib/staline.nvim", config=setup("c", "staline") }
        use { "lewis6991/gitsigns.nvim", config=setup("d", "gitsigns") }


        --- general ---
        use { "nvim-lua/plenary.nvim" }
        use { "cappyzawa/trim.nvim", config=setup("d", "trim") }
        use { "windwp/nvim-autopairs", config=setup("d", "nvim-autopairs") }
        use { "norcalli/nvim-colorizer.lua", config=setup("d", "colorizer") }
        use { "lukas-reineke/indent-blankline.nvim", config=setup("d", "indent_blankline")  }
        use { "numToStr/Comment.nvim", config=setup("d", "Comment") }
        use { "akinsho/bufferline.nvim", config=setup("c", "bufferline") }
        use { "kyazdani42/nvim-tree.lua", config=setup("c", "nvim_tree") }
        use { "nvim-treesitter/nvim-treesitter", config=setup("c", "treesitter") }
        use { "nvim-telescope/telescope.nvim", config=setup("c", "telescope") }
        use { "nvim-telescope/telescope-fzf-native.nvim", run="make" }
        use { "ziontee113/icon-picker.nvim", config=setup("c", "icon_picker") }


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
    end
})
