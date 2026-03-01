-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
--
-- Moving lines up and down in visual mode bind.
vim.keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selected lines up.' })
vim.keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selected lines down.' })

vim.keymap.set('n', ',g', ':Neogit cwd=%:p:h<Cr>', { desc = 'Open Neo[G]it' })
vim.keymap.set('n', ',c', ':Neogit commit cwd=%:p:h<Cr>', { desc = '[C]ommit with Neogit' })

vim.keymap.set('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<Cr>', { desc = 'Show [E]rror in a float window' })

-- Changing tab and shift to be 4 spaces instead.
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

return {
  require 'custom.plugins.venv-selector',
  require 'custom.plugins.undo-tree',
  require 'custom.plugins.guess-indent',
  require 'custom.plugins.neogit',
  require 'custom.plugins.feline',
  require 'custom.plugins.vimtex',
  require 'custom.plugins.luasnip',
  require('luasnip.loaders.from_lua').lazy_load { paths = '~/.config/nvim/luasnippets/' },
  require 'custom.plugins.nvimsurround',
  require 'custom.plugins.wrapping',
}
