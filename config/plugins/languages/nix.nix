{pkgs, ...}: {
  extraPackages = with pkgs; [
    nix
    alejandra
  ];

  plugins = {
    lsp.servers.nil-ls = {
      enable = true;
      settings.nix = {
        maxMemoryMB = 20000; #  home-manager need at least this...
        flake = {
          autoEvalInputs = true;
          autoArchive = true;
        };
      };
    };

    conform-nvim = {
      formattersByFt = {
        nix = [
          "alejandra"
        ];
      };
    };
    lint = {
      lintersByFt = {
        nix = ["nix"];
      };
    };
  };
}
