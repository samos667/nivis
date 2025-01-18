{pkgs, ...}: {
  extraPackages = with pkgs; [
    vifm-full
  ];
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      pname = "vifm.vim";
      version = "0.13";
      src = pkgs.fetchFromGitHub {
        owner = "vifm";
        repo = "vifm.vim";
        rev = "a8130c37d144b51d84bee19f0532abcd3583383f";
        hash = "sha256-nvwMBoGZSULSNCVPnfLCqF6AiH5NcFEYKz4jUD79Tp0=";
      };
    })
  ];
}
