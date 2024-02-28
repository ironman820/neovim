{
  autoCmd = [
    {
      event = ["TermClose"];
      pattern = "*lazygit";
      callback = ''
        function()
          if package.loaded["neo-tree.sources.git_status"] then
            require("neo-tree.sources.git_status").refresh()
          end
        end
      '';
    }
  ];
  extraConfigLua = ''
    local map = user_util.map
    local root = user_util.find_root()
    local command = require("neo-tree.command")
    map("<leader>fe", function()
      command.execute({ toggle = true, dir = root })
    end, { desc = "Explorer NeoTree (root dir)" })
    map("<leader>fE", function()
      command.execute({ toggle = true, dir = vim.loop.cwd() })
    end, { desc = "Explorer NeoTree (cwd)" })
    map("<leader>e", "<leader>fe", { desc = "Explorer NeoTree (root dir)", remap = true })
    map("<leader>E", "<leader>fE", { desc = "Explorer NeoTree (cwd)", remap = true })
    map("<leader>ge", function()
      command.execute({ source = "git_status", toggle = true })
    end, { desc = "Git explorer" })
    map("<leader>be", function()
      command.execute({ source = "buffers", toggle = true })
    end, { desc = "Buffer explorer" })
  '';
  plugins.neo-tree = {
    enable = true;
    defaultComponentConfigs.indent = {
      withExpanders = true;
      expanderCollapsed = "";
      expanderExpanded = "";
      expanderHighlight = "NeoTreeExpander";
    };
    filesystem = {
      bindToCwd = false;
      followCurrentFile.enabled = true;
      useLibuvFileWatcher = true;
    };
    sources = [
      "filesystem"
      "buffers"
      "git_status"
      "document_symbols"
    ];
  };
}
