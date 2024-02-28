{
  config = {
    options = {
      foldcolumn = "1";
      foldenable = true;
      foldlevelstart = 99;
    };
    keymaps = let
      ufo = "require(\"ufo\")";
    in [
      {
        action = "${ufo}.openAllFolds";
        key = "zR";
        lua = true;
        mode = ["n"];
      }
      {
        action = "${ufo}.closeAllFolds";
        key = "zM";
        lua = true;
        mode = ["n"];
      }
      {
        action = "<Cmd>set foldlevel-=1<CR>zz";
        key = "<Leader>-";
        options.desc = "zoom out (see less)";
        mode = ["n"];
      }
      {
        action = "<Cmd>set foldlevel+=1<CR>zz";
        key = "<Leader>=";
        options.desc = "zoom in (see more)";
        mode = ["n"];
      }
      {
        action = "<Cmd>set foldlevel=0<CR>zM";
        key = "<Leader><Leader>-";
        options.desc = "zoom out max";
        mode = ["n"];
      }
      {
        action = "<Cmd>set foldlevel=20<CR>zR";
        key = "<Leader><Leader>=";
        options.desc = "zoom in max";
        mode = ["n"];
      }
      {
        action = "zkzxzz";
        key = "Z";
        mode = ["n"];
      }
      {
        action = "zjzxzz";
        key = "X";
        mode = ["n"];
      }
    ];
    plugins.nvim-ufo = {
      enable = true;
      providerSelector = ''
        function(_, _, _)
          return { "treesitter", "indent" }
        end
      '';
    };
  };
}
