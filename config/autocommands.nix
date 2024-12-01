{
  autoCmd = [
    # Vertically center document when entering insert mode
    {
      event = "InsertEnter";
      command = "norm zz";
    }

    # Set indentation to 2 spaces for nix files
    {
      event = "FileType";
      pattern = "nix";
      command = "setlocal tabstop=2 shiftwidth=2";
    }

    # Enable spellcheck for some filetypes
    {
      event = "FileType";
      pattern = ["tex" "latex" "markdown" "norg"];
      command = "setlocal spell spelllang=en,fr";
    }
    # Init Quarto on md file
    {
      event = "FileType";
      pattern = ["markdown"];
      command = "QuartoActivate";
    }
  ];
}
