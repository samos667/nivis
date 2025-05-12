{
  autoCmd = [
    # Enable spellcheck for some filetypes
    {
      event = "FileType";
      pattern = ["tex" "latex" "markdown" "norg"];
      command = "setlocal spell spelllang=en,fr";
    }
  ];
}
