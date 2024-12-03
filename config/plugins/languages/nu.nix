{pkgs, ...}: {
  extraPackages = with pkgs; [
    nufmt
  ];
  # Set filetype to "nu" for files named "*.nu"
  filetype.extension.nu = "nu";

  # Add our nu parser to treesitter and associate it with nu filetype.
  extraConfigLua = ''
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    parser_config.nu = {
      filetype = "nu",
    }
  '';

  # Add the nu injections
  extraFiles = with pkgs.tree-sitter-grammars; {
    "/queries/nu/highlights.scm".source = "${tree-sitter-nu}/queries/nu/highlights.scm";
    "/queries/nu/injections.scm".source = "${tree-sitter-nu}/queries/nu/injections.scm"; # https://github.com/nushell/tree-sitter-nu/issues/102
  };

  plugins = {
    lsp.servers.nushell.enable = true;

    # TODO https://github.com/nushell/nufmt # Actually broken
    # conform-nvim = {
    #   formattersByFt = {
    #     nu = [
    #       "nufmt"
    #     ];
    #   };
    # };
    #
    treesitter = {
      languageRegister.nu = "nu";
      grammarPackages = with pkgs;
        vimPlugins.nvim-treesitter.passthru.allGrammars
        ++ (with tree-sitter-grammars; [tree-sitter-nu]);
    };
  };
}
