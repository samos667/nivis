{pkgs, ...}: {
  plugins.spectre = {
    enable = true;
    findPackage = pkgs.ripgrep;
    replacePackage = pkgs.gnused;
  };
}
