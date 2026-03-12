-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    { '\\', ':Neotree reveal float<CR>', desc = 'NeoTree reveal', silent = true },
    { '|', ':Neotree reveal buffers float<CR>', desc = 'NeoTree reveal buffers', silent = true },
  },
  opts = {
    filesystem = {
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['<tab>'] = function(state)
            local node = state.tree:get_node()
            if require('neo-tree.utils').is_expandable(node) then
              state.commands['toggle_node'](state)
            else
              state.commands['open'](state)
              vim.cmd 'Neotree reveal'
            end
          end,
        },
      },
      function(_, opts)
        local function on_move(data)
          Snacks.rename.on_rename_file(data.source, data.destination)
        end
        local events = require 'neo-tree.events'
        opts.event_handlers = opts.event_handlers or {}
        vim.list_extend(opts.event_handlers, {
          { event = events.FILE_MOVED, handler = on_move },
          { event = events.FILE_RENAMED, handler = on_move },
        })
      end,
    },
    buffers = {
      window = {
        mappings = {
          ['|'] = 'close_window',
        },
      },
    },
  },
}
