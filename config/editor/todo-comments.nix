{
  keymaps = [
    {
      action = "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>";
      key = "<leader>xT";
      options.desc = "Todo/Fix/Fixme (Trouble)";
    }
    {
      action = "<cmd>todoTelescope keywords=TODO,FIX,FIXME<cr>";
      key = "<leader>sT";
      options.desc = "Todo/Fix/Fixme";
    }
  ];
  plugins.todo-comments = {
    enable = true;
    keymaps = {
      todoTrouble.key = "<leader>xt";
      todoTelescope.key = "<leader>st";
    };
  };
}
