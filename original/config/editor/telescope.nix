{
  extraConfigLuaPre = ''
    local telescope = require("telescope")
    telescope.load_extension("aerial")
    local actions = require("telescope.actions")

    local open_with_trouble = function(...)
      return require("trouble.providers.telescope").open_with_trouble(...)
    end
    local open_selected_with_trouble = function(...)
      return require("trouble.providers.telescope").open_selected_with_trouble(...)
    end
    local find_files_no_ignore = function()
      local action_state = require("telescope.actions.state")
      local line = action_state.get_current_line()
      telescope.find_files({ no_ignore = true, default_text = line })
    end
    local find_files_with_hidden = function()
      local action_state = require("telescope.actions.state")
      local line = action_state.get_current_line()
      telescope.find_files({ hidden = true, default_text = line })
    end
  '';
  keymaps = let
    builtin = "require(\"telescope.builtin\")";
  in [
    {
      key = "<leader>,";
      action = ''
        function()
          ${builtin}.buffers({ sort_mru = true, sort_lastused = true })
        end
      '';
      lua = true;
      options.desc = "Switch Buffer";
    }
    {
      key = "<leader>/";
      action = "${builtin}.live_grep";
      lua = true;
      options.desc = "Grep (root dir)";
    }
    {
      key = "<leader>:";
      action = "${builtin}.command_history";
      lua = true;
      options.desc = "Command History";
    }
    {
      key = "<leader><space>";
      action = "${builtin}.find_files";
      lua = true;
      options.desc = "Find Files (root dir)";
    }
    {
      key = "<leader>fb";
      action = ''
        function()
          ${builtin}.buffers({ sort_mru = true, sort_lastused = true })
        end
      '';
      lua = true;
      options.desc = "Buffers";
    }
    {
      key = "<leader>ff";
      action = "${builtin}.find_files";
      lua = true;
      options.desc = "Find Files (root dir)";
    }
    {
      key = "<leader>fF";
      action = ''
        function()
          ${builtin}.find_files({ cwd = false })
        end
      '';
      lua = true;
      options.desc = "Find Files (cwd)";
    }
    {
      key = "<leader>fr";
      action = "${builtin}.oldfiles";
      lua = true;
      options.desc = "Recent";
    }
    {
      key = "<leader>fR";
      action = ''
        function()
          ${builtin}.oldfiles({ cwd = vim.loop.cwd() })
        end
      '';
      lua = true;
      options.desc = "Recent (cwd)";
    }
    {
      key = "<leader>gb";
      action = "${builtin}.git_branches";
      lua = true;
      options.desc = "branches";
    }
    {
      key = "<leader>gc";
      action = "${builtin}.git_commits";
      lua = true;
      options.desc = "commits";
    }
    {
      key = "<leader>gs";
      action = "${builtin}.git_status";
      lua = true;
      options.desc = "status";
    }
    {
      key = "<leader>s\"";
      action = "${builtin}.registers";
      lua = true;
      options.desc = "Registers";
    }
    {
      key = "<leader>sa";
      action = "${builtin}.autocommands";
      lua = true;
      options.desc = "Auto Commands";
    }
    {
      key = "<leader>sb";
      action = "${builtin}.current_buffer_fuzzy_find";
      lua = true;
      options.desc = "Buffer";
    }
    {
      key = "<leader>sc";
      action = "${builtin}.command_history";
      lua = true;
      options.desc = "Command History";
    }
    {
      key = "<leader>sC";
      action = "${builtin}.commands";
      lua = true;
      options.desc = "Commands";
    }
    {
      key = "<leader>sd";
      action = ''
          function()
        ${builtin}.diagnostics({ bufnr = 0 })
          end
      '';
      lua = true;
      options.desc = "Document diagnostics";
    }
    {
      key = "<leader>sD";
      action = "${builtin}.diagnostics";
      lua = true;
      options.desc = "Workspace diagnostics";
    }
    {
      key = "<leader>sg";
      action = "${builtin}.live_grep";
      lua = true;
      options.desc = "Grep (root dir)";
    }
    {
      key = "<leader>sG";
      action = ''
          function()
        ${builtin}.live_grep({ cwd = utils.buffer_dir() })
          end
      '';
      lua = true;
      options.desc = "Grep (cwd)";
    }
    {
      key = "<leader>sh";
      action = "${builtin}.help_tags";
      lua = true;
      options.desc = "Help Pages";
    }
    {
      key = "<leader>sH";
      action = "${builtin}.highlights";
      lua = true;
      options.desc = "Search Highlight Groups";
    }
    {
      key = "<leader>sk";
      action = "${builtin}.keymaps";
      lua = true;
      options.desc = "Key Maps";
    }
    {
      key = "<leader>sM";
      action = "${builtin}.man_pages";
      lua = true;
      options.desc = "Man Pages";
    }
    {
      key = "<leader>sm";
      action = "${builtin}.marks";
      lua = true;
      options.desc = "Jump to Mark";
    }
    {
      key = "<leader>so";
      action = "${builtin}.vim_options";
      lua = true;
      options.desc = "Options";
    }
    {
      key = "<leader>sR";
      action = "${builtin}.resume";
      lua = true;
      options.desc = "Resume";
    }
    {
      key = "<leader>sw";
      action = ''
          function()
        ${builtin}.grep_string({ word_match = "-w" })
          end
      '';
      lua = true;
      options.desc = "Word (root dir)";
    }
    {
      key = "<leader>sW";
      action = ''
          function()
        ${builtin}.grep_string({ cwd = false, word_match = "-w" })
          end
      '';
      lua = true;
      options.desc = "Word (cwd)";
    }
    {
      key = "<leader>sW";
      action = ''
          function()
        ${builtin}.grep_string({ cwd = false })
          end
      '';
      lua = true;
      options.desc = "Selection (cwd)";
      mode = ["v"];
    }
    {
      key = "<leader>ss";
      action = "<cmd>Telescope aerial<cr>";
      options.desc = "Goto Symbol";
    }
    {
      key = "<leader>sS";
      action = ''
        function()
          ${builtin}.lsp_dynamic_workspace_symbols({ symbols = user_util.get_kind_filter() })
        end
      '';
      lua = true;
      options.desc = "Goto Symbol (Workspace)";
    }
  ];
  plugins.telescope = {
    enable = true;
    settings.defaults = {
      prompt_prefix = " ";
      selection_caret = " ";
      get_selection_window = {
        __raw = ''
          function()
            local wins = vim.api.nvim_list_wins()
            table.insert(wins, 1, vim.api.nvim_get_current_win())
            for _, win in ipairs(wins) do
              local buf = vim.api.nvim_win_get_buf(win)
              if vim.bo[buf].buftype == "" then
                return win
              end
            end
            return 0
          end
        '';
      };
      mappings = let
        actions = "require(\"telescope.actions\")";
      in {
        i = {
          "<c-t>" = {__raw = "open_with_trouble";};
          "<a-t>" = {__raw = "open_selected_with_trouble";};
          "<a-i>" = {__raw = "find_files_no_ignore";};
          "<a-h>" = {__raw = "find_files_with_hidden";};
          "<C-j>" = {__raw = "${actions}.cycle_history_next";};
          "<C-k>" = {__raw = "${actions}.cycle_history_prev";};
          "<C-f>" = {__raw = "${actions}.preview_scrolling_down";};
          "<C-b>" = {__raw = "${actions}.preview_scrolling_up";};
          "<esc>" = {__raw = "${actions}.close";};
        };
        n = {
          "q" = {__raw = "${actions}.close";};
          "<esc>" = {__raw = "${actions}.close";};
        };
      };
    };
    extensions = {
      fzf-native.enable = true;
    };
  };
}
