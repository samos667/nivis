{pkgs, ...}: {
  extraPackages = with pkgs; [
    stylua
    luajitPackages.luacheck
  ];

  plugins = {
    lsp.servers.lua-ls.enable = true;

    conform-nvim.settings.formatters_by_ft.lua = [
      "stylua"
    ];

    lint.lintersByFt.lua = [
      "luacheck"
    ];
  };
}
