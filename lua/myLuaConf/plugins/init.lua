require('lze').load {
  {
    'dropbar.nvim',
    for_cat = 'general.extra',
    event = "DeferredUIEnter",
    after = function(_)
      require('dropbar').setup()
      local dropbar_api = require('dropbar.api')
      vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
      vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
      vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })
    end
  },
  {
    "cloak.nvim",
    for_cat = 'general.extra',
    event = "DeferredUIEnter",
    keys = { { "<leader>cc", "<cmd>CloakToggle<cr>", mode = { "n" }, desc = "Toggle cloak" }, },
    after = function(plugin)
      require('cloak').setup()
    end,
  },
  {
    "comment.nvim",
    for_cat = 'general.extra',
    event = "DeferredUIEnter",
    after = function(plugin)
      require('Comment').setup()
    end,
  },
  {
    "nvim-surround",
    for_cat = 'general.always',
    event = "DeferredUIEnter",
    -- keys = "",
    after = function(plugin)
      require('nvim-surround').setup()
    end,
  },
  {
    "vim-startuptime",
    for_cat = 'general.extra',
    cmd = { "StartupTime" },
    before = function(_)
      vim.g.startuptime_event_width = 0
      vim.g.startuptime_tries = 10
      vim.g.startuptime_exe_path = nixCats.packageBinPath
    end,
  },
  {
    "transparent.nvim",
    for_cat = 'general.extra',
    event = "DeferredUIEnter",
    -- keys = "",
    after = function(plugin)
      require('transparent').setup()
    end,
  },
  {
    "fidget.nvim",
    for_cat = 'general.extra',
    event = "DeferredUIEnter",
    -- keys = "",
    after = function(plugin)
      require('fidget').setup({})
    end,
  },
  -- {
  --   "hlargs",
  --   for_cat = 'general.extra',
  --   event = "DeferredUIEnter",
  --   -- keys = "",
  --   dep_of = { "nvim-lspconfig" },
  --   after = function(plugin)
  --     require('hlargs').setup {
  --       color = '#32a88f',
  --     }
  --     vim.cmd([[hi clear @lsp.type.parameter]])
  --     vim.cmd([[hi link @lsp.type.parameter Hlargs]])
  --   end,
  -- },
  {
    "lualine.nvim",
    for_cat = 'general.always',
    -- cmd = { "" },
    event = "DeferredUIEnter",
    -- ft = "",
    -- keys = "",
    -- colorscheme = "",
    after = function(plugin)
      local icons = require("user-icons")
      require('lualine').setup({
        options = {
          icons_enabled = false,
          theme = colorschemeName,
          component_separators = '|',
          section_separators = '',
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            require("user-util").find_root(),
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            {
              'filename', path = 1, status = true,
            },
          },
          lualine_x = {
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
              source = function()
                ---@diagnostic disable-next-line
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
          },
          lualine_y = {
            { "progress", separator = " ",                  padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            function()
              return " " .. os.date("%R")
            end,
          },
        },
      })
    end,
  },
  {
    "gitsigns.nvim",
    for_cat = 'general.always',
    event = "DeferredUIEnter",
    -- cmd = { "" },
    -- ft = "",
    -- keys = "",
    -- colorscheme = "",
    after = function(plugin)
      require('gitsigns').setup({
        -- See `:help gitsigns.txt`
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map({ 'n', 'v' }, ']c', function()
            if vim.wo.diff then
              return ']c'
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return '<Ignore>'
          end, { expr = true, desc = 'Jump to next hunk' })

          map({ 'n', 'v' }, '[c', function()
            if vim.wo.diff then
              return '[c'
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return '<Ignore>'
          end, { expr = true, desc = 'Jump to previous hunk' })

          -- Actions
          -- visual mode
          map('v', '<leader>hs', function()
            gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end, { desc = 'stage git hunk' })
          map('v', '<leader>hr', function()
            gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end, { desc = 'reset git hunk' })
          -- normal mode
          map('n', '<leader>gs', gs.stage_hunk, { desc = 'git stage hunk' })
          map('n', '<leader>gr', gs.reset_hunk, { desc = 'git reset hunk' })
          map('n', '<leader>gS', gs.stage_buffer, { desc = 'git Stage buffer' })
          map('n', '<leader>gu', gs.undo_stage_hunk, { desc = 'undo stage hunk' })
          map('n', '<leader>gR', gs.reset_buffer, { desc = 'git Reset buffer' })
          map('n', '<leader>gp', gs.preview_hunk, { desc = 'preview git hunk' })
          map('n', '<leader>gb', function()
            gs.blame_line { full = false }
          end, { desc = 'git blame line' })
          map('n', '<leader>gd', gs.diffthis, { desc = 'git diff against index' })
          map('n', '<leader>gD', function()
            gs.diffthis '~'
          end, { desc = 'git diff against last commit' })

          -- Toggles
          map('n', '<leader>gtb', gs.toggle_current_line_blame, { desc = 'toggle git blame line' })
          map('n', '<leader>gtd', gs.toggle_deleted, { desc = 'toggle git show deleted' })

          -- Text object
          map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'select git hunk' })
        end,
      })
      vim.cmd([[hi GitSignsAdd guifg=#04de21]])
      vim.cmd([[hi GitSignsChange guifg=#83fce6]])
      vim.cmd([[hi GitSignsDelete guifg=#fa2525]])
    end,
  },
  {
    "which-key.nvim",
    for_cat = 'general.extra',
    -- cmd = { "" },
    event = "DeferredUIEnter",
    -- ft = "",
    -- keys = "",
    -- colorscheme = "",
    after = function(plugin)
      require('which-key').setup({
      })
      require('which-key').add {
        { "<leader>b",         group = "[b]uffer" },
        { "<leader><leader>_", hidden = true },
        { "<leader>c",         group = "[c]ode" },
        { "<leader>c_",        hidden = true },
        { "<leader>d",         group = "[d]ocument" },
        { "<leader>d_",        hidden = true },
        { "<leader>F",         group = "[F]ormat" },
        { "<leader>g",         group = "[g]it" },
        { "<leader>g_",        hidden = true },
        { "<leader>m",         group = "[m]arkdown" },
        { "<leader>m_",        hidden = true },
        { "<leader>r",         group = "[r]ename" },
        { "<leader>r_",        hidden = true },
        { "<leader>s",         group = "[s]earch" },
        { "<leader>s_",        hidden = true },
        { "<leader>t",         group = "[t]oggles" },
        { "<leader>t_",        hidden = true },
        { "<leader>w",         group = "[w]orkspace" },
        { "<leader>w_",        hidden = true },
      }
    end,
  },
}
