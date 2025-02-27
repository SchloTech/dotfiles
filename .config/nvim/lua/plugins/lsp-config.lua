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
                    "gitlab_ci_ls"
            },
        })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.ansiblels.setup({})
      lspconfig.bashls.setup({})
      lspconfig.tailwindcss.setup({})
      lspconfig.dockerls.setup({})
      lspconfig.helm_ls.setup({})
      lspconfig.html.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.jsonls.setup({})
      lspconfig.grammarly.setup({})
      lspconfig.jedi_language_server.setup({})
      lspconfig.sqlls.setup({})
      lspconfig.tflint.setup({})
      lspconfig.harper_ls.setup({})
      lspconfig.gitlab_ci_ls.setup({})


      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
};
