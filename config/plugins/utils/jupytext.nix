{pkgs, ...}: {
  extraPackages = with pkgs; [
    python312Packages.jupytext
  ];

  plugins.jupytext.enable = true;
}
