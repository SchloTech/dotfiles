return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "ansiblels",
                    "bashls",
                    "tailwindcss",
                    "dockerls",
                    "helm_ls",
                    "html",
                    "ts_ls",
                    "jsonls",
                    "grammarly",
                    "jedi_language_server",
                    "sqlls",
                    "tflint",
                    "harper_ls",
                    "gitlab_ci_ls",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { 'saghen/blink.cmp' },

        opts = {
            servers = {
                lua_ls = {},
                ansiblels = {},
                bashls = {},
                tailwindcss = {},
                dockerls = {},
                helm_ls = {},
                html = {},
                ts_ls = {},
                jsonls = {},
                grammarly = {},
                jedi_language_server = {},
                sqlls = {},
                tflint = {},
                harper_ls = {},
                gitlab_ci_ls = {}
            }
        },

        config = function(_, opts)
            local lspconfig = require("lspconfig")
            local cmp_capabilities = require('blink.cmp').get_lsp_capabilities()

            for server, config in pairs(opts.servers) do
                config.capabilities = vim.tbl_deep_extend("force", cmp_capabilities, config.capabilities or {})
                lspconfig[server].setup(config)
            end

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
