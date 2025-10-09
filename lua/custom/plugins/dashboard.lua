-- return {
--   'nvimdev/dashboard-nvim',
--   event = 'VimEnter',
--   config = function()
--     require('dashboard').setup {
--       -- config
--     }
--   end,
--   dependencies = { { 'nvim-tree/nvim-web-devicons' } },
-- }
--
return {
  'goolord/alpha-nvim',
  lazy = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- require('alpha').setup(require('alpha.themes.dashboard').config)

    local alpha = require 'alpha'
    local dashboard = require 'alpha.themes.dashboard'

    dashboard.section.header.val = {
      [[                                                    ]],
      [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
      [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
      [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
      [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
      [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
      [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
      [[                                                    ]],
    }

    --Set menu
    dashboard.section.buttons.val = {
      dashboard.button('e', '📄  New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('f', '🔍  Find file', ':Telescope find_files <CR>'),
      dashboard.button('c', '⚙️  Open Config (~/.config/nvim)', ':e ~/.config/nvim<CR>'),
      dashboard.button('l', '📦  Lazy Plugin Manager', ':Lazy<CR>'),
      dashboard.button('m', '🧱  Mason Package Manager', ':Mason<CR>'),
      dashboard.button('q', '🚪  Quit Neovim', ':qa<CR>'),
    }

    local function footer()
      local datetime = os.date '📅 %Y-%m-%d             ⏰ %H:%M:%S'
      local version = vim.version()
      local nvim_version = string.format('	  🧪 Neovim           v%d.%d.%d', version.major, version.minor, version.patch)

      local lazy_plugins = require('lazy').stats()
      local lazy_info = string.format('	  📦 Lazy Plugins     %d', lazy_plugins.count)

      return {
        '',
        datetime,
        '',
        nvim_version,
        '',
        lazy_info,
      }
    end

    dashboard.section.footer.val = footer()
    dashboard.section.footer.opts = {
      position = 'center',
    }
    dashboard.section.footer.opts.hl = 'Constant'

    require('alpha').setup(dashboard.config)
    alpha.setup(dashboard.opts)
  end,
}
