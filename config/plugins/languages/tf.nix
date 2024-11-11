{pkgs, ...}: {
  extraPackages = with pkgs; [terraform];

  plugins = {
    treesitter.languageRegister.terraform = "tf";

    lsp.servers.terraformls = {
      filetypes = ["tf"];
      enable = true;
    };

    conform-nvim = {
      formattersByFt = {
        terraform = [
          "terraform_fmt"
        ];
      };
    };
  };
}
