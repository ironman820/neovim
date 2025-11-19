local load_w_after = function(name)
  vim.cmd.packadd(name)
  vim.cmd.packadd(name .. '/after')
end

return {
  {
    "blink.cmp",
    for_cat = "general.blink",
    event = "DeferredUIEnter",
    after = function (_)
      require("blink.cmp").setup({
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- See :h blink-cmp-config-keymap for configuring keymaps
        cmdline = {
          enabled = true,
          completion = {
            menu = {
              auto_show = true,
            },
          },
          sources = function()
            local type = vim.fn.getcmdtype()
            -- Search forward and backward
            if type == '/' or type == '?' then return { 'buffer' } end
            -- Commands
            if type == ':' or type == '@' then return { 'cmdline', 'cmp_cmdline' } end
            return {}
          end,
        },
      })
    end,
  },
}
