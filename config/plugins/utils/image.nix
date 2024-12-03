{
  plugins.image = {
    enable = true;
    backend = "kitty";
    windowOverlapClearEnabled = true;
    windowOverlapClearFtIgnore = [
      "cmp_menu"
      "cmp_docs"
      ""
    ];

    maxHeight = 200;
    maxWidth = 400;
    maxHeightWindowPercentage = 4294967295;
    maxWidthWindowPercentage = 4294967295;
  };
}
