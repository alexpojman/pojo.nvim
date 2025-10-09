return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      size = function(term)
        if term.direction == 'horizontal' then
          return 15
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
      end, -- Default size for horizontal/vertical splits
      open_mapping = [[<c-\>]], -- Default mapping to open/close
      hide_numbers = true, -- Hide line numbers in terminal
      start_in_insert = true, -- Start in insert mode
      insert_mappings = true, -- Enable default insert mode mappings
      terminal_mappings = true, -- Enable default terminal mode mappings
      persist_size = true, -- Remember terminal size
      direction = 'float', -- Default direction
      float_opts = {
        border = 'curved',
        winblend = 10,
        highlights = {
          border = 'Normal',
          background = 'Normal',
        },
      },
    }
  end,
  keys = {
    -- Default keybinding to toggle the last active terminal
    { '<leader>tt', '<cmd>ToggleTerm<cr>', desc = 'Toggle Terminal' },
    -- Example for a floating terminal
    { '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', desc = 'Toggle Floating Terminal' },
    -- Example for a horizontal terminal
    { '<leader>tH', '<cmd>ToggleTerm direction=horizontal<cr>', desc = 'Toggle Horizontal Terminal' },
    -- Example for a vertical terminal
    { '<leader>tv', '<cmd>ToggleTerm direction=vertical<cr>', desc = 'Toggle Vertical Terminal' },
  },
}
