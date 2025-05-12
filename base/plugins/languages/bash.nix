{pkgs, ...}: {
  extraPackages = with pkgs; [
    beautysh
    shellcheck
  ];

  plugins = {
    lsp.servers.bashls.enable = true;

    conform-nvim.settings.formatters_by_ft.bash = [
      "beautysh"
    ];

    lint.lintersByFt.bash = [
      "shellcheck"
    ];
  };
}
