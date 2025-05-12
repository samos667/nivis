{pkgs, ...}: {
  extraPackages = with pkgs; [
    black
  ];
  plugins = {
    lsp.servers.pyright.enable = true;
    dap-python.enable = true;

    conform-nvim.settings.formatters_by_ft.python = [
      "black"
    ];
  };
}
