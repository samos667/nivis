{pkgs, ...}: {
  extraPackages = with pkgs; [
    prettierd
    vale
    valeStyles.google
    valeStyles.readability
    valeStyles.write-good
  ];

  plugins = {
    conform-nvim = {
      formattersByFt = {
        markdown = [
          "prettierd"
        ];
      };
    };
    lint = {
      lintersByFt = {
        lua = [
          "vale" # fix vale style path
        ];
      };
    };
  };
}
