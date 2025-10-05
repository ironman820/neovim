{
  plugins.which-key = {
    enable = true;
    hidden = ["<silent>" "<cmd>" "<Cmd>" "<CR>" "^:" "^ " "^call " "^lua " "v"];
    registrations = {
      "g" = "+goto";
      "gs" = "+surround";
      "]" = "+next";
      "[" = "+prev";
      "<leader><tab>" = "+tabs";
      "<leader>b" = "+buffer";
      "<leader>c" = "+code";
      "<leader>f" = "+file/find";
      "<leader>g" = "+git";
      "<leader>gh" = "+hunks";
      "<leader>q" = "+quit/session";
      "<leader>s" = "+search";
      "<leader>u" = "+ui";
      "<leader>w" = "+windows";
      "<leader>x" = "+diagnostics/quickfix";
      "<c-space>" = "Increment selection";
      "<bs>" = "Decrement selection";
      "<leader>d" = "+debug";
    };
  };
}
