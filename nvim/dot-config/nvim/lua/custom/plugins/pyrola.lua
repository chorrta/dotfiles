return {
  'matarina/pyrola.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  build = ':UpdateRemotePlugins',
  config = function()
    local pyrola = require 'pyrola'

    pyrola.setup {
      kernel_map = {
        python = 'py3', -- Jupyter kernel name
        r = 'ir',
      },
      split_horizontal = false,
      split_ratio = 0.35, -- width of split REPL terminal
      image = {
        cell_width = 20, -- approximate terminal cell width in pixels
        cell_height = 35, -- approximate terminal cell height in pixels
        max_width_ratio = 0.9, -- image width as a fraction of editor columns
        max_height_ratio = 0.7, -- image height as a fraction of editor lines
        offset_row = 0, -- adjust image row position (cells)
        offset_col = 0, -- adjust image col position (cells)
      },
    }

    -- Default key mappings (adjust to taste)

    -- Send semantic code block under cursor
    vim.keymap.set('n', '<leader>rc', function()
      pyrola.send_statement_definition()
    end, { noremap = true, desc = 'Send block under cursor' })

    -- Send visual selection
    vim.keymap.set('v', '<leader>rs', function()
      pyrola.send_visual_to_repl()
    end, { noremap = true, desc = 'Send visual selection' })

    -- Send entire buffer
    vim.keymap.set('n', '<leader>rb', function()
      pyrola.send_buffer_to_repl()
    end, { noremap = true, desc = 'Send entire buffer.' })

    -- Inspect variable under cursor
    vim.keymap.set('n', '<leader>ri', function()
      pyrola.inspect()
    end, { noremap = true, desc = 'Inspect variable under cursor' })

    -- Open history image viewer
    vim.keymap.set('n', '<leader>rh', function()
      pyrola.open_history_manager()
    end, { noremap = true, desc = 'Open hisory image viewer' })
  end,

  vim.keymap.set('n', '<Leader>rI', '<cmd>Pyrola init<cr>', { noremap = true, desc = 'Run Pyrola init' }),
}
