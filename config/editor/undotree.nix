{
  keymaps = [
    {
      action = "function() require('undotree').toggle() end";
      key = "<leader>bu";
      lua = true;
      options.desc = "Open Undotree";
      mode = ["n"];
    }
  ];
  plugins.undotree.enable = true;
}
