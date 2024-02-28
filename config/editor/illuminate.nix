{
  autoCmd = [
    {
      event = ["FileType"];
      callback = {
        __raw = ''
          function()
            local function map(key, dir, buffer)
              vim.keymap.set("n", key, function()
                illuminate["goto_" .. dir .. "_reference"](false)
              end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
            end
            local buffer = vim.api.nvim_get_current_buf()
            map("]]", "next", buffer)
            map("[[", "prev", buffer)
          end
        '';
      };
    }
  ];
  keymaps = [
    {
      mode = ["n"];
      key = "]]";
      action = ''
        function()
          illuminate["goto_next_reference"](false)
        end
      '';
      lua = true;
      options = {
        desc = "Next Reference";
      };
    }
    {
      mode = ["n"];
      key = "[[";
      action = ''
        function()
          illuminate["goto_prev_reference"](false)
        end
      '';
      lua = true;
      options = {
        desc = "Prev Reference";
      };
    }
  ];
  plugins.illuminate = {
    enable = true;
    delay = 200;
    largeFileCutoff = 2000;
    largeFileOverrides.providers = ["lsp"];
  };
}
