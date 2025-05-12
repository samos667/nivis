{
  plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;
      folding = true;
      settings = {
        highlight.enable = true;
        indent.enable = true;
      };
    };
  };

  imports = [
    ./bqf.nix
    ./comment.nix
    ./hmts.nix
  ];
}
