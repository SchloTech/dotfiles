return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require('lualine').setup({
      options = {
        theme = 'auto',  -- This will automatically match your colorscheme
        transparent = true,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
      },
      sections = {
        lualine_c = {
          {
            'filename',
            path = 1  -- 0 = just filename, 1 = relative path, 2 = absolute path
          }
        }
      }
    })
  end
}
