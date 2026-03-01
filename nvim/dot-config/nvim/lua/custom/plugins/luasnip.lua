return {
  'L3MON4D3/LuaSnip',
  opts = {
    -- follow latest release.
    version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = 'make install_jsregexp',
  },
  config = function()
    -- Luasnip config
    vim.cmd [[
    " Use Tab to expand and jump through snippets
    imap <silent><expr> <C-y> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<C-y>'
    imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'

    imap <silent><expr> <C-n> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-n>'
    smap <silent><expr> <C-n> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-n>'
    
    " Use Shift-Tab to jump backwards through snippets
    imap <silent><expr> <C-p> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-p>'
    smap <silent><expr> <C-p> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-p>'

    " Cycle forward through choice nodes with Control-f (for example)
    imap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
    smap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
  ]]

    -- Somewhere in your Neovim startup, e.g. init.lua
    require('luasnip').config.set_config { -- Setting LuaSnip config

      -- Enable autotriggered snippets
      enable_autosnippets = true,

      -- Use Tab (or some other key if you prefer) to trigger visual selection
      store_selection_keys = '<Tab>',
      update_events = 'TextChanged, TextChangedI',
    }
    vim.keymap.set(
      'n',
      '<Leader>rL',
      '<Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/luasnippets/"})<CR>',
      { noremap = true, desc = 'Reload Snippets.' }
    )
  end,
}
