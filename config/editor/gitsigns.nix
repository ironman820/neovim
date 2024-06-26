{
  plugins.gitsigns = {
    enable = true;
    settings = {
      current_line_blame = true;
      current_line_blame_opts.virtTextPos = "right_align";
      numhl = true;
      on_attach = ''
        function(buffer)
          if vim.api.nvim_command_output("!git rev-parse --is-inside-work-tree") == false then
            return false
          end
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
          end

            -- stylua: ignore start
            map("n", "]h", gs.next_hunk, "Next Hunk")
            map("n", "[h", gs.prev_hunk, "Prev Hunk")
            map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
            map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
            map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
            map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
            map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
            map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
            map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
            map("n", "<leader>ghd", gs.diffthis, "Diff This")
            map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
            map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
          end
      '';
      preview_config = {
        border = "single";
        style = "minimal";
        relative = "cursor";
        row = 0;
        col = 1;
      };
      signs = {
        add = {
          hl = "GitSignsAdd";
          text = "";
          numhl = "GitSignsAddNr";
          linehl = "GitSignsAddLn";
        };
        change = {
          hl = "GitSignsChange";
          text = "±";
          numhl = "GitSignsChangeNr";
          linehl = "GitSignsChangeLn";
        };
        delete = {
          hl = "GitSignsDelete";
          text = "󰆴";
          numhl = "GitSignsDeleteNr";
          linehl = "GitSignsDeleteLn";
        };
        topdelete = {
          hl = "GitSignsDelete";
          text = "※";
          numhl = "GitSignsDeleteNr";
          linehl = "GitSignsDeleteLn";
        };
        changedelete = {
          hl = "GitSignsChange";
          text = "▲";
          numhl = "GitSignsChangeNr";
          linehl = "GitSignsChangeLn";
        };
        untracked = {text = "▎";};
      };
    };
    # yadm.enable = true;
  };
}
