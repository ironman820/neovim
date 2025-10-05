{
  keymaps = [
    {
      action = ''
        function()
          require("oil").open_float()
        end
      '';
      key = "-";
      lua = true;
      options.desc = "Oil file explorer";
      mode = ["n"];
    }
  ];
  plugins.oil = {
    enable = true;
    settings = {
      columns = [
        "icon"
        "size"
        "type"
      ];
      float.padding = 5;
      view_options.show_hidden = true;
    };
  };
}
