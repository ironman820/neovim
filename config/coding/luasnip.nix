{
  keymaps = [
    {
      key = "<tab>";
      action = ''
          function()
          return luasnip.jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end
      '';
      lua = true;
      options = {
        expr = true;
        silent = true;
      };
      mode = "i";
    }
    {
      key = "<tab>";
      action = ''
          function()
          luasnip.jump(1)
        end
      '';
      lua = true;
      mode = "s";
    }
    {
      key = "<s-tab>";
      action = ''
            function()
          luasnip.jump(-1)
        end
      '';
      lua = true;
      mode = ["i" "s"];
    }
    {
      key = "<leader>us";
      action = "<cmd>source ~/.config/nvim/after/plugin/nix.lua<cr>";
      options.desc = "Source Luasnip Snippets";
      mode = "n";
    }
  ];
  plugins.luasnip = {
    enable = true;
    extraConfig = {
      history = true;
      check_events = [
        "TextChanged"
        "TextChangedI"
      ];
    };
    fromLua = [
      {
        paths = ./files/snippets;
      }
    ];
  };
}
