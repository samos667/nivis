{
  performance = {
    byteCompileLua = {
      enable = true;
      plugins = true;
      initLua = true;
      nvimRuntime = true;
    };
    # # lsp binary path is not set when enabled ?
    # combinePlugins = {
    #   enable = false;
    #   standalonePlugins = [
    #     "mini.nvim" # https://github.com/nix-community/nixvim/issues/2544
    #     # TS injections
    #     "hmts.nvim"
    #     "nvim-treesitter"
    #   ];
    # };
  };
}
