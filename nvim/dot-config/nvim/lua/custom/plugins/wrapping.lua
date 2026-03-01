return {
  'andrewferrier/wrapping.nvim',
  config = function()
    require('wrapping').setup {
      softener = { latex = true, tex = true },
      notify_on_switch = false,
    }
  end,
}
