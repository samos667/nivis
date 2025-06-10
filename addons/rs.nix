{pkgs, ...}: {
  extraPackages = with pkgs; [
    rustfmt
    gcc
    cargo
    rustc
  ];

  plugins = {
    dap-lldb.enable = true;
    rustaceanvim.enable = true;

    conform-nvim.settings.formatters_by_ft = {
      rs = [
        "rustfmt"
      ];
    };
  };
}
