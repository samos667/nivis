{pkgs, ...}: {
  extraPackages = with pkgs; [opentofu];

  plugins = {
    treesitter.languageRegister.terraform = "tf";

    lsp.servers = {
      terraformls = {
        enable = true;
      };
      tflint = {
        enable = true;
      };
    };

    conform-nvim.settings.formatters_by_ft.terraform = [
      "tofu_fmt"
    ];
  };
}
