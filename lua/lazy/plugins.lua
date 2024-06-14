local get_config = function(setup_type, setup_name, plugin_category)
  if setup_type == "d" then
    return load(('require("%s").setup()'):format(setup_name))
  elseif setup_type == "c" and plugin_category then
    return load(('require("configs.%s").%s()'):format(plugin_category, setup_name))
  end
end

local plugins = {
  -- colorschemes
  {
    "ntk148v/komau.vim",
    lazy = false,
    priority = 1000,
    -- config = get_config("c", "komau", "clrsch")
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = get_config("c", "rose_pine", "clrsch")
  },

  -- visual
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = get_config("d", "gitsigns")
  },
  {
    "xiyaowong/nvim-transparent",
    lazy = false,
    config = get_config("d", "transparent")
  },
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    config = get_config("d", "dressing")
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = false,
    config = get_config("c", "devicons", "visual")
  },
  {
    "levouh/tint.nvim",
    lazy = false,
    config = get_config("c", "tint", "visual")
  },
  {
    "folke/twilight.nvim",
    lazy = false,
    config = get_config("c", "twilight", "visual")
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = get_config("c", "zen_mode", "visual")
  },
  {
    "tamton-aquib/staline.nvim",
    lazy = false,
    config = get_config("c", "staline", "visual")
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPre", "BufNewFile" },
    config = get_config("c", "indent", "visual")
  },

  -- functional
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = { "windwp/nvim-ts-autotag" },
    config = get_config("c", "treesitter", "func")
  },
  {
    "numToStr/Comment.nvim",
    lazy = true,
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = get_config("c", "comment", "func")
  },
  {
    "folke/todo-comments.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = get_config("c", "todo_comments", "func")
  },
  {
    "akinsho/bufferline.nvim",
    keys = "<leader>te",
    config = get_config("c", "bufferline", "func")
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim"
    },
    config = get_config("c", "telescope", "func")
  },
  {
    "ggandor/lightspeed.nvim",
    dependencies = { "tpope/vim-repeat" }
  },
  {
    "cappyzawa/trim.nvim",
    event = "BufWrite",
    config = get_config("d", "trim")
  },
  { "szw/vim-maximizer" },
  { "Darazaki/indent-o-matic" },

  -- language support
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "folke/neodev.nvim", opts = {} }
    },
    config = get_config("c", "lspconfig", "langsup")
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim"
    },
    config = get_config("c", "mason", "langsup")
  },
  {
    "L3MON4D3/LuaSnip",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = { "rafamadriz/friendly-snippets" },
    config = get_config("c", "snippets", "langsup")
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip"
    },
    config = get_config("c", "cmp", "langsup")
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = get_config("c", "conform", "langsup")
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = get_config("c", "lint", "langsup")
  }
}


return plugins
