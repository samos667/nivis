{pkgs, ...}: let
  vale = pkgs.vale.withStyles (s: [s.alex s.readability s.proselint s.microsoft s.google]);
in {
  extraPackages = with pkgs; [
    prettierd
    vale
  ];

  plugins = {
    conform-nvim.settings.formatters_by_ft.markdown = [
      "prettierd"
    ];
    lint.lintersByFt.markdown = [
      "vale"
    ];
  };
}
