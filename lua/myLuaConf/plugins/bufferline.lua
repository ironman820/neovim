return {
  "bufferline.nvim",
  for_cat = 'general.always',
  -- cmd = { "" },
  event = "DeferredUIEnter",
  -- ft = "",
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", mode = { "n" }, desc = "Toggle pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", mode = { "n" }, desc = "Delete non-pinned buffers" },
    { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", mode = { "n" }, desc = "Delete other buffers" },
    { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", mode = { "n" }, desc = "Delete buffers to the right" },
    { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", mode = { "n" }, desc = "Delete buffers to the left" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", mode = { "n" }, desc = "Prev buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", mode = { "n" }, desc = "Next buffer" },
    { "[b", "<cmd>BufferLineCyclePrev<cr>", mode = { "n" }, desc = "Prev buffer" },
    { "]b", "<cmd>BufferLineCycleNext<cr>", mode = { "n" }, desc = "Next buffer" },
  },
  -- colorscheme = "",
  after = function(plugin)
    require('bufferline').setup({
      ---@diagnostic disable-next-line: missing-fields
      options = {
        -- stylua: ignore
        close_command = function(n) require("mini.bufremove").delete(n, false) end,
        -- stylua: ignore
        right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
        diagnostics = "nvim_lsp",
        always_show_bufferline = true,
        diagnostics_indicator = function(_, _, diag)
          local icons = {
            Error = " ",
            Warn = " ",
            Hint = " ",
            Info = " ",
          }
          local ret = (diag.error and icons.Error .. diag.error .. " " or "")
              .. (diag.warning and icons.Warn .. diag.warning or "")
          return vim.trim(ret)
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    })
  end,
}
