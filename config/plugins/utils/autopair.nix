{pkgs, ...}: {
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      pname = "ultimate-autopair.nvim";
      version = "2024-08-05";
      src = pkgs.fetchFromGitHub {
        owner = "altermo";
        repo = "ultimate-autopair.nvim";
        rev = "1420fb9e07b1d80cc6d87e7d90827fb2c1109cb3";
        sha256 = "sha256-KNQcYhRWmpGNG8oafb8p7htT2Q/oG6sbpEDRLue7Nbw=";
      };
    })
  ];
  extraConfigLua = ''
    require('ultimate-autopair').setup()
  '';
}
