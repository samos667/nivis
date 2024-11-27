{pkgs, ...}: {
  plugins.image = {
    enable = true;
    backend = "ueberzug";
    ueberzugPackage = pkgs.ueberzugpp;
  };
}
