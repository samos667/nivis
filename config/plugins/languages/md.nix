{pkgs, ...}: {
  extraPackages = with pkgs; [
    prettierd
    vale
    valeStyles.google
    valeStyles.readability
    valeStyles.write-good
  ];

  plugins = {
    conform-nvim.settings.formatters_by_ft.markdown = [
      "prettierd"
    ];
    lint.lintersByFt.lua = [
      "vale" #TODO fix vale style path
    ];
  };
}
