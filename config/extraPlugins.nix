{
  conceal-nvim,
  pkgs,
  ...
}: {
  extraConfigLuaPost = builtins.readFile ./extraPlugins.lua;
  keymaps = [
    {
      key = "<leader>cs";
      action = "<cmd>AerialToggle<cr>";
      options.desc = "Aerial (Symbols)";
    }
    {
      key = "<leader>uc";
      action = ''
        function()
          require("conceal").toggle_conceal()
        end
      '';
      lua = true;
      options = {
        desc = "Toggle Conceal";
        silent = true;
      };
      mode = "n";
    }
    {
      action = ''
        function()
          require("spectre").open()
        end
      '';
      key = "<leader>sr";
      lua = true;
      options.desc = "Replace in files (spectre)";
    }
  ];
  extraPlugins = let
    inherit (pkgs.vimUtils) buildVimPlugin;
  in
    with pkgs.vimPlugins; [
      aerial-nvim
      (buildVimPlugin {
        name = "conceal-nvim";
        src = conceal-nvim;
      })
      hop-nvim
      nvim-spectre
    ];
}
