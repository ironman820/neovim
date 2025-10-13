return {
  {
    "snacks.nvim",
    for_cat = 'general.snacks',
    opts = {
      bigfile = { enabled = true },
      dim = { enabled = true },
      image = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      lazygit = { enabled = true },
      notifier = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = false }, -- we set this in options.lua
      -- toggle = { map = LazyVim.safe_keymap_set },
      words = { enabled = true },
      zen = { enabled = true },
    },
    -- stylua: ignore
    keys = {
      {
        "<leader>gg",
        function()
          Snacks.lazygit()
        end,
        desc = "Lazygit"
      },
      {
        "<leader>n",
        function()
          if Snacks.config.picker and Snacks.config.picker.enabled then
            Snacks.picker.notifications()
          else
            Snacks.notifier.show_history()
          end
        end,
        desc = "Notification History"
      },
      { "<leader>ud", function() Snacks.dim() end, desc = "[D]im" },
      { "<leader>uD", function() Snacks.dim.disable() end, desc = "[D]isable dim" },
      { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
      { "<leader>z",  function() Snacks.zen() end,           desc = "Toggle Zen Mode" },
      { "<leader>Z",  function() Snacks.zen.zoom() end,      desc = "Toggle Zoom" },
    },
  }
}
