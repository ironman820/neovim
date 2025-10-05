{
  extraConfigLuaPost = ''
    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
    local defaults = require("cmp.config.default")()
            require("cmp").setup.filetype(
              { "sql", "mysql", "plsql" },
              vim.tbl_extend("force", defaults, {
                sources = require("cmp").config.sources({
                  { name = "vim-dadbod-completion" },
                }),
              })
            )
            require("cmp").setup.filetype(
              "gitcommit",
              vim.tbl_extend("force", defaults, {
                sources = require("cmp").config.sources({
                  { name = "git" },
                }, {
                  { name = "buffer" },
                }),
              })
            )
        require("cmp").setup.cmdline(
          { "/", "?" },
          vim.tbl_extend("force", defaults, {
            mapping = require("cmp").mapping.preset.cmdline(),
            sources = {
              { name = "buffer" },
            },
          })
        )
        require("cmp").setup.cmdline(
          ":",
          vim.tbl_extend("force", defaults, {
            mapping = require("cmp").mapping.preset.cmdline(),
            sources = require("cmp").config.sources({
              { name = "path" },
            }, {
              { name = "cmdline" },
            }),
          })
        )
  '';
  plugins.cmp = {
    enable = true;
    settings = {
      completion.completeopt = "menu,menuone,noinsert";
      experimental.ghost_text.hl_group = "require(\"cmp\")GhostText";
      formatting.format = ''
        function(_, item)
          local icons = user-icons.kinds
          if icons[item.kind] then
            item.kind = icons[item.kind] .. item.kind
          end
          return item
        end
      '';
      mapping = {
        "<C-j>" = "require(\"cmp\").mapping.select_next_item({ behavior = require(\"cmp\").SelectBehavior.Insert })";
        "<C-k>" = "require(\"cmp\").mapping.select_prev_item({ behavior = require(\"cmp\").SelectBehavior.Insert })";
        "<C-u>" = "require(\"cmp\").mapping.scroll_docs(-4)";
        "<C-d>" = "require(\"cmp\").mapping.scroll_docs(4)";
        "<C-Space>" = "require(\"cmp\").mapping.complete()";
        "<C-e>" = "require(\"cmp\").mapping.abort()";
        "<CR>" = "require(\"cmp\").mapping.confirm({ select = false })";
        "<S-CR>" = "require(\"cmp\").mapping.confirm({
      behavior = require(\"cmp\").ConfirmBehavior.Replace,
      select = true,
    })";
        "<C-CR>" = "function(fallback)
      require(\"cmp\").abort()
      fallback()
    end";
      };
      # mappingPresets = ["insert"];
      snippet.expand = ''
        function(args)
          require("luasnip").lsp_expand(args.body)
        end
      '';
      sources = [
        {name = "nvim_lsp";}
        {name = "luasnip";}
        {name = "buffer";}
        {name = "path";}
        {name = "nerdfont";}
      ];
    };
    # window = {
    #   completion.border = [];
    #   documentation.border = [];
    # };
  };
}
