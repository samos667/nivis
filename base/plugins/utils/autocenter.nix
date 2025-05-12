{pkgs, ...}: {
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      pname = "nvim-autocenter";
      version = "2024-09-15";
      src = pkgs.fetchFromGitHub {
        owner = "LZDQ";
        repo = "nvim-autocenter";
        rev = "a3e4cc327233483228f44776cce5a53d9f523362";
        hash = "sha256-3OkY654cV9nZ+F4CwzJNITxaELAFIms9StnxPfWreiE=";
      };
    })
  ];
  extraConfigLua = "require('nvim-autocenter').setup{}";
}
