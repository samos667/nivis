{pkgs, ...}: {
  extraPackages = with pkgs; [
    beautysh
    shellcheck
  ];

  plugins = {
    lsp.servers.bashls.enable = true;

    conform-nvim = {
      formattersByFt = {
        bash = [
          "beautysh"
        ];
      };
    };

    lint = {
      lintersByFt = {
        bash = [
          "shellcheck"
        ];
      };
    };
  };
}
