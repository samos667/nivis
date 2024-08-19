{pkgs, ...}:{
  extraPackages = with pkgs;[
    stylua
    luajitPackages.luacheck
  ];

  plugins = {
    lsp.servers.lua-ls.enable = true;

    conform-nvim = {
      formattersByFt = {
        lua = [
          "stylua"
        ];
      };
    };

    lint = {
      lintersByFt = {
        lua = [
          "luacheck"
        ];
      };
    };
  };
}
