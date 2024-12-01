{pkgs, ...}: {
  extraPackages = with pkgs; [
    go
    gofumpt
    delve
    templ # https://templ.guide/
    air
  ];

  plugins = {
    dap.extensions.dap-go.enable = true;
    neotest.enable = true;
    neotest.adapters.go.enable = true;

    lsp.servers = {
      gopls.enable = true;
      templ.enable = true;
    };

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
