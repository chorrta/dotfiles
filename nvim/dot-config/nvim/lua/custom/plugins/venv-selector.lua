return {
  'linux-cultist/venv-selector.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } }, -- optional: you can also use fzf-lua, snacks, mini-pick instead.
  },
  ft = 'python', -- Load when opening Python files
  keys = {
    { ',v', '<cmd>VenvSelect<cr>' }, -- Open picker on keymap
  },
  opts = { -- this can be an empty lua table - just showing below for clarity.
    search = {}, -- if you add your own searches, they go here.
    options = {
      activate_venv_in_terminal = true,
      set_environment_variables = true,
      notify_user_on_venv_activation = true,
    }, -- if you add plugin options, they go here.
  },
}
