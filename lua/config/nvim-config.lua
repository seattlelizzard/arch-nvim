vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd('set background=dark') -- or 'light'
vim.cmd('highlight LineNr guifg=#ffffff guibg=#000000')
vim.cmd('hi LineNrAbove guifg=red ctermfg=red')
vim.cmd('highlight LineNrBelow guifg=#bdff96 ctermfg=green')
-- Toggle relative line numbers
vim.api.nvim_set_keymap('n', '<leader>n', ':set relativenumber!<CR>', { noremap = true, silent = true })

vim.cmd('hi Normal ctermbg=none') -- or 'light'
vim.cmd('highlight LineNr ctermbg=none') -- or 'light'
vim.cmd('highlight NonText ctermbg=none') -- or 'light'
vim.cmd('highlight Normal guibg=NONE ctermbg=NONE')

vim.cmd('highlight NeoTreeNormal guibg=NONE ctermbg=NONE')
vim.cmd('highlight NeoTreeIndentMarker guibg=NONE ctermbg=NONE')
vim.cmd('highlight NeoTreeDirectoryName guibg=NONE ctermbg=NONE')
vim.cmd('highlight NeoTreeFileName guibg=NONE ctermbg=NONE')
vim.cmd('highlight NeoTreeNormal guibg=NONE ctermbg=NONE')
vim.cmd('highlight NeoTreeWinSeparator guibg=NONE ctermbg=NONE')
vim.cmd('highlight NeoTreeDirectory guibg=NONE ctermbg=NONE')
vim.cmd('highlight NeoTreeFile guibg=NONE ctermbg=NONE')
vim.cmd('highlight NeoTreeIndentMarker guibg=NONE ctermbg=NONE')
vim.cmd('highlight Normal guibg=NONE ctermbg=NONE')
vim.cmd('highlight NeoTreeNormal guibg=NONE ctermbg=NONE')
vim.cmd('highlight NeoTreeWinSeparator guibg=NONE ctermbg=NONE')
vim.cmd('highlight NeoTreeDirectory guibg=NONE ctermbg=NONE')
vim.cmd('highlight NeoTreeFile guibg=NONE ctermbg=NONE')
vim.cmd('highlight NeoTreeIndentMarker guibg=NONE ctermbg=NONE')
vim.cmd('highlight NeoTreeCursorLine guibg=NONE ctermbg=NONE')
vim.cmd('highlight NeoTreeGitModified guibg=NONE ctermbg=NONE')
vim.cmd('highlight NeoTreeGitDeleted guibg=NONE ctermbg=NONE')
