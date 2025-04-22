{pkgs, ...}: {
  extraPackages = with pkgs; [
    gofumpt
    templ # https://templ.guide/
  ];

  plugins = {
    lsp.servers = {
      gopls.enable = true;
      templ.enable = true;
    };
    dap-go.enable = true;

    conform-nvim.settings.formatters_by_ft = {
      go = [
        "gofumpt"
      ];
      templ = [
        "templ"
      ];
    };
  };
}
