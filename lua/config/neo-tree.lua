vim.keymap.set('n','<leader>e',':Neotree toggle left <CR>') 

vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
