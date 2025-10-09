return {
  'kdheepak/lazygit.nvim',
  -- optional: for floating window border decoration
  requires = { 'nvim-lua/plenary.nvim' },
  config = function()
    -- Optional: configure keymaps to open Lazygit
    vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', { desc = 'Open Lazygit' })
  end,
}
