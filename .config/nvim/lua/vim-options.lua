vim.g.mapleader = " "
vim.g.transparent_enabled = true

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 10
vim.opt.clipboard:prepend { 'unnamed', 'unnamedplus' }

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = "*",
  callback = function(args)
    if args.file:match("%.tpl$") then
      vim.bo.filetype = "helm"
    end
  end,
})

vim.opt.list = true
vim.opt.listchars = {
  space = '·',
  tab = '»·',
  trail = '·',
  extends = '>',
  precedes = '<',
}
