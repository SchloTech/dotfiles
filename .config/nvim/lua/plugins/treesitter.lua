return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
            ensure_installed = { "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "bash", "css", "dockerfile", "hcl", "html", "javascript", "jq", "json", "regex", "python", "sql", "terraform", "groovy", "tmux", "toml", "typescript", "yaml" },
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
