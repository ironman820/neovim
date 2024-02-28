{
  colorschemes.catppuccin = {
    enable = true;
    dimInactive.enabled = false;
    integrations = {
      aerial = true;
      cmp = true;
      dashboard = true;
      gitsigns = true;
      hop = true;
      headlines = true;
      illuminate = {
        enabled = true;
        lsp = true;
      };
      indent_blankline = {
        enabled = true;
        colored_indent_levels = true;
      };
      leap = true;
      lsp_trouble = true;
      mason = true;
      mini.enabled = true;
      native_lsp = {
        enabled = true;
        underlines = {
          errors = ["undercurl"];
          hints = ["undercurl"];
          warnings = ["undercurl"];
          information = ["undercurl"];
        };
      };
      navic = {
        enabled = true;
        custom_bg = "lualine";
      };
      neotest = true;
      neotree = true;
      noice = true;
      notify = true;
      semantic_tokens = true;
      telescope.enabled = true;
      treesitter = true;
      treesitter_context = true;
      which_key = true;
    };
  };
}
