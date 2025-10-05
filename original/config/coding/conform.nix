{
  autoCmd = [
    {
      event = ["BufWritePre"];
      pattern = ["*"];
      callback = {
        __raw = ''
          function (args)
            require("conform").format({ bufnr = args.buf })
          end
        '';
      };
    }
  ];
  extraConfigLuaPost = ''
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  '';
  keymaps = [
    {
      key = "<leader>cf";
      action = ''
        function()
          require("conform").format()
        end
      '';
      lua = true;
      options.desc = "Format Langs";
      mode = ["n" "v"];
    }
  ];
  plugins.conform-nvim = {
    enable = true;
    formatters.injected.options.ignore_errors = true;
    formattersByFt = {
      bash = ["beautysh"];
      css = ["stylint"];
      html = ["djlint"];
      just = ["just"];
      lua = ["stylua"];
      nix = ["alejandra"];
      php = ["phpcbf" "php_cs_fixer"];
      python = ["isort" "black" "autoflake"];
      "*" = ["auto_optional" "codespell" "trim_newlines" "trim_whitespace"];
      "_" = ["injected"];
    };
  };
}
