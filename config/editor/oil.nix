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
    columns = {
      icon.enable = true;
      size.enable = true;
      type.enable = true;
    };
    float.padding = 5;
    viewOptions.showHidden = true;
  };
}
