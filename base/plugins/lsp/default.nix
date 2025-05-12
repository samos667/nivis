{
  plugins = {
    lsp = {
      enable = true;
      keymaps = {
        silent = true;

        diagnostic = {
          # Navigate in diagnostics
          "<leader>k" = "goto_prev";
          "<leader>j" = "goto_next";
        };

        lspBuf = {
          gd = "definition";
          gD = "references";
          gt = "type_definition";
          gi = "implementation";
          K = "hover";
          "<F2>" = "rename";
        };
      };
    };
  };

  imports = [
    ./conform.nix
    ./lines.nix
    ./lint.nix
    ./lspsaga.nix
    ./signature.nix
    ./trouble.nix
  ];
}
