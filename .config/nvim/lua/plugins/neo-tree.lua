return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- Smart <leader>e toggle: open if not focused, close if focused
    vim.keymap.set("n", "<leader>e", function()
      local win = vim.api.nvim_get_current_win()
      local buf = vim.api.nvim_win_get_buf(win)
      local ft = vim.api.nvim_buf_get_option(buf, "filetype")

      if ft == "neo-tree" then
        -- Already in Neo-tree, so close it
        require("neo-tree.command").execute({ action = "close" })
      else
        -- Not in Neo-tree, so focus it
        require("neo-tree.command").execute({ action = "focus", source = "filesystem" })
      end
    end, { noremap = true, silent = true })

    -- Auto-close Neo-tree after opening a file
    require("neo-tree").setup({
      event_handlers = {
        {
          event = "file_opened",
          handler = function(file_path)
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },
    })
  end,
}
