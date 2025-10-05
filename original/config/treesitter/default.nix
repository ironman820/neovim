{pkgs, ...}: {
  imports = [];
  plugins = {
    treesitter = {
      enable = true;
      ensureInstalled = [];
      folding = true;
      grammarPackages = with pkgs.tree-sitter-grammars; [
        tree-sitter-lua
        tree-sitter-nix
      ];
      incrementalSelection.enable = true;
      indent = true;
    };
    treesitter-context.enable = true;
    treesitter-refactor.enable = true;
    treesitter-textobjects = {
      enable = true;
      move.enable = true;
    };
  };
}
