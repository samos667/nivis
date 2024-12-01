{pkgs, ...}: {
  extraPackages = with pkgs; [terraform];

  plugins = {
    treesitter.languageRegister.terraform = "tf";

    lsp.servers.terraformls = {
      filetypes = ["tf"];
      enable = true;
    };

    conform-nvim.settings.formatters_by_ft.terraform = [
      "terraform_fmt"
    ];
  };
}
