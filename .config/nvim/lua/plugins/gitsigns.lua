return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "+" },
    },
    current_line_blame = false,
  },
  keys = {
    { "]c", function() require("gitsigns").next_hunk() end, desc = "Next hunk" },
    { "[c", function() require("gitsigns").prev_hunk() end, desc = "Prev hunk" },
    { "<leader>gs", function() require("gitsigns").stage_hunk() end, desc = "Stage hunk" },
    { "<leader>gr", function() require("gitsigns").reset_hunk() end, desc = "Reset hunk" },
    { "<leader>gp", function() require("gitsigns").preview_hunk() end, desc = "Preview hunk" },
  },
}

