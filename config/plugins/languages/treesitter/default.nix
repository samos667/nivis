{
  plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;
      settings = {
        highlight.enable = true;
      };
    };
  };

  imports = [
    # ./context.nix # conflict with neorg + not really useful
    ./bqf.nix
    ./comment.nix
    ./hmts.nix
    ./refactor.nix
  ];
}
