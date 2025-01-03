{pkgs, ...}: {
  extraPackages = with pkgs; [
    black
    pylint
    python312
    python312Packages.debugpy
    python312Packages.flake8
  ];
  plugins = {
    dap.extensions.dap-python.enable = true;
    lsp.servers.pyright.enable = true;

    conform-nvim.settings.formatters_by_ft.python = [
      "black"
    ];
  };
}
