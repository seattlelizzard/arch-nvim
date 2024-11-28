return {
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require'colorizer'.setup {
        '*', -- Highlight all files by default
        css = { rgb_fn = true }, -- Enable rgb() and rgba() in CSS
        html = { names = false }, -- Disable named colors in HTML
        '!vim', -- Exclude Vim filetype from highlighting
      }
    end
  }
}
