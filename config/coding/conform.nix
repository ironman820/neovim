{
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
    formatOnSave = {};
    formatters.injected.options.ignore_errors = true;
    formattersByFt = {
      lua = ["stylua"];
      nix = ["alejandra"];
      php = ["phpcbf" "php_cs_fixer"];
      python = ["isort" "black"];
    };
  };
}
