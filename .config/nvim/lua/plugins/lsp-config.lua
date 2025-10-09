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
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local function bufname()
        return vim.api.nvim_buf_get_name(0)
      end

      local function dirname(path)
        return (vim.fs and vim.fs.dirname) and vim.fs.dirname(path) or path:match("(.+)/[^/]+/?$") or path
      end

      local function root_dir(patterns)
        local start = dirname(bufname())
        local find = (vim.fs and vim.fs.find) or function(pats, opts)
          local dir = opts.path
          while dir do
            for _, pat in ipairs(pats) do
              local candidate = dir .. "/" .. pat
              if vim.loop.fs_stat(candidate) then
                return { candidate }
              end
            end
            local parent = dir:match("(.+)/[^/]+/?$")
            if parent == dir then break end
            dir = parent
          end
          return {}
        end
        local found = find(patterns, { path = start, upward = true })[1]
        return found and dirname(found) or vim.loop.cwd()
      end

      local function start_server(name, cmd, ft, patterns, extra)
        extra = extra or {}
        vim.api.nvim_create_autocmd("FileType", {
          pattern = ft,
          callback = function()
            local cfg = vim.tbl_deep_extend("force", {
              name = name,
              cmd = cmd,
              root_dir = root_dir(patterns or { ".git" }),
              capabilities = capabilities,
            }, extra)
            vim.lsp.start(cfg)
          end,
        })
      end

      -- Servers
      start_server(
        "lua_ls",
        { "lua-language-server" },
        { "lua" },
        { ".luarc.json", ".luarc.jsonc", ".git" },
        {
          settings = {
            Lua = {
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        }
      )

      start_server("bashls", { "bash-language-server", "start" }, { "sh" }, { ".git" })

      start_server(
        "ts_ls",
        { "typescript-language-server", "--stdio" },
        { "typescript", "typescriptreact", "javascript", "javascriptreact" },
        { "package.json", "tsconfig.json", "jsconfig.json", ".git" }
      )

      start_server("jsonls", { "vscode-json-language-server", "--stdio" }, { "json", "jsonc" }, { ".git" })
      start_server("html", { "vscode-html-language-server", "--stdio" }, { "html" }, { ".git" })
      start_server("dockerls", { "docker-langserver", "--stdio" }, { "dockerfile" }, { ".git" })

      start_server(
        "tailwindcss",
        { "tailwindcss-language-server" },
        { "typescript", "typescriptreact", "javascript", "javascriptreact", "html", "css", "scss", "svelte" },
        { "package.json", "tailwind.config.js", "tailwind.config.ts", ".git" }
      )

      start_server("jedi_language_server", { "jedi-language-server" }, { "python" }, { "pyproject.toml", "setup.py", ".git" })
      start_server("ansiblels", { "ansible-language-server", "--stdio" }, { "yaml", "yml", "ansible" }, { ".git" })
      start_server("sqlls", { "sql-language-server", "up", "--method", "stdio" }, { "sql" }, { ".git" })

      -- Keymaps
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
