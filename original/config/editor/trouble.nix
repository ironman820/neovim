{
  keymaps = [
    {
      action = "<cmd>TroubleToggle document_diagnostics<cr>";
      key = "<leader>xx";
      options.desc = "Document Diagnostics (Trouble)";
    }
    {
      action = "<cmd>TroubleToggle workspace_diagnostics<cr>";
      key = "<leader>xX";
      options.desc = "Workspace Diagnostics (Trouble)";
    }
    {
      action = "<cmd>TroubleToggle loclist<cr>";
      key = "<leader>xL";
      options.desc = "Location List (Trouble)";
    }
    {
      action = "<cmd>TroubleToggle quickfix<cr>";
      key = "<leader>xQ";
      options.desc = "Quickfix List (Trouble)";
    }
    {
      key = "[q";
      action = ''
            function()
          if trouble.is_open() then
            trouble.previous({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cprev)
            if not ok then
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end
      '';
      lua = true;
      options.desc = "Previous trouble/quickfix item";
    }
    {
      key = "]q";
      action = ''
            function()
          if trouble.is_open() then
            trouble.next({ skip_groups = true, jump = true })
          else
            local ok, err = pcall(vim.cmd.cnext)
            if not ok then
              ---@diagnostic disable-next-line: param-type-mismatch
              vim.notify(err, vim.log.levels.ERROR)
            end
          end
        end
      '';
      lua = true;
      options.desc = "Next trouble/quickfix item";
    }
  ];
  plugins.trouble = {
    enable = true;
    settings = {
      auto_close = true;
      use_diagnostic_signs = true;
    };
  };
}
