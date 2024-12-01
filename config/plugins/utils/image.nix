{pkgs, ...}: {
  plugins.image = {
    enable = true;
    backend = "ueberzug";
    ueberzugPackage = pkgs.ueberzugpp;
    windowOverlapClearEnabled = true;
    windowOverlapClearFtIgnore = [
      "cmp_menu"
      "cmp_docs"
      ""
    ];

    maxHeightWindowPercentage = 4294967295;
    maxWidthWindowPercentage = 4294967295;
  };
}
