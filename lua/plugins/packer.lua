local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()


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
        use { "ellisonleao/gruvbox.nvim", config=setup("c", "gruvbox") }
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
        use { "numToStr/Comment.nvim", config=setup("d", "Comment") }
        use { "lukas-reineke/indent-blankline.nvim", config=setup("c", "indent_blankline")  }
        use { "folke/todo-comments.nvim", config=setup("c", "todo_comments") }
        use { "akinsho/bufferline.nvim", config=setup("c", "bufferline") }
        use { "nvim-treesitter/nvim-treesitter", config=setup("c", "treesitter") }
        use { "nvim-telescope/telescope.nvim", config=setup("c", "telescope") }
        use { "nvim-telescope/telescope-file-browser.nvim" }


        --- lsp & autocmp ---
        use { "williamboman/mason.nvim", config=setup("d", "mason") }
        use { "williamboman/mason-lspconfig.nvim", config=setup("c", "lspconfig_w_mason") }
        use { "neovim/nvim-lspconfig", config=setup("c", "lspconfig") }
        use { "L3MON4D3/LuaSnip" }
        use { "hrsh7th/nvim-cmp", after={"LuaSnip"}, config=setup("c", "cmp") }
        use { "hrsh7th/cmp-path", after={"nvim-cmp"} }
        use { "hrsh7th/cmp-nvim-lsp", module="cmp_nvim_lsp", after={"nvim-cmp"} }
        use { "hrsh7th/cmp-buffer", after={"nvim-cmp"} }
        use { "hrsh7th/cmp-nvim-lsp-signature-help", after={"nvim-cmp"} }
        use { "saadparwaiz1/cmp_luasnip", after={"nvim-cmp"} }
        use { "kevinoid/vim-jsonc" }
        use { "neoclide/vim-jsx-improve" }


        --- maybe later ---
        -- use { "nvim-tree/nvim-tree.lua", config=setup("c", "nvim_tree") }
    end
})
