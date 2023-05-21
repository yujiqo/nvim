local lsp = {}


lsp.lspconfig = function()
    local lspconfig = require("lspconfig")
    local lsp_defaults = lspconfig.util.default_config

    require("lspconfig.ui.windows").default_options = {
        border = "rounded"
    }

    -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    --     vim.lsp.handlers.hover,
    --     {
    --         border = "rounded"
    --     }
    -- )
    --
    -- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    --     vim.lsp.handlers.signature_help,
    --     {
    --         border = "rounded"
    --     }
    -- )
    --
    -- vim.cmd[[highlight FloatBorder ctermfg=NONE ctermbg=NONE cterm=NONE]]

    vim.diagnostic.config({
        -- virtual_text = {
        --     prefix = ""
        -- },
        virtual_text = false,
        underline = {Error=true},
        float = {
            -- border = "rounded",
            header = "",
            focusable = false,
            prefix = function(_, _, _) return "" , "String" end,
            suffix = ""
        }
    })

    local signs = require("utils").diagnostic_signs

    for name, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. name

        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    lsp_defaults.capabilities = vim.tbl_deep_extend(
        "force",
        lsp_defaults.capabilities,
        require("cmp_nvim_lsp").default_capabilities()
    )

    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    local servers = require("utils").servers

    mason.setup({})
    mason_lspconfig.setup({
        ensure_installed = servers
    })

    mason_lspconfig.setup_handlers({
        function(server)
            lspconfig[server].setup({})
        end
    })
end


lsp.cmp = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local kind_icons = require("utils").lsp_icons


    cmp.setup({
        completion = {
            autocomplete = false
        },
        formatting = {
            fields = { 'kind', 'abbr', 'menu' },
            format = function(_, item)
                item.kind = kind_icons[item.kind] or " "
                item.menu = "  "
                return item
            end
        },
        -- window = {
        --     completion = cmp.config.window.bordered(),
        --     documentation = cmp.config.window.bordered(),
        -- },
        snippet = {
            expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert {
            ["<Tab>"] = cmp.mapping.select_next_item(),
            ["<S-Tab>"] = cmp.mapping.select_prev_item(),
            ["<C-b>"] = cmp.mapping.scroll_docs(-1),
            ["<C-f>"] = cmp.mapping.scroll_docs(1),
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = true })
        },
        sources = cmp.config.sources {
            { name = "nvim_lsp" },
            { name = "path" },
            { name = "buffer" },
            { name = "luasnip" }
        },
        -- experimental = {
        --     ghost_text = true
        -- }
    })
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
            {{ name = 'path' }},
            {{ name = 'cmdline' }}
        )
    })
end


return lsp
