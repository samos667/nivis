{pkgs, ...}: {
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      pname = "nvim-sops";
      version = "2024-10-26";
      src = pkgs.fetchFromGitHub {
        owner = "lucidph3nx";
        repo = "nvim-sops";
        rev = "cb2209562d00ef8c6c88bdec836d9edb8fbb96ef";
        hash = "sha256-kppkZtdDQzsqOL+iAclc8Ziij8ZaC9r1m6SNKEu3fTs=";
      };
    })
  ];
  keymaps = [
    {
      mode = "n";
      key = "<leader>ef";
      action = "<cmd>SopsEncrypt<cr>";
      options = {
        silent = true;
        desc = "Sops [E]ncrypt [F]ile";
      };
    }
    {
      mode = "n";
      key = "<leader>df";
      action = "<cmd>SopsDecrypt<cr>";
      options = {
        silent = true;
        desc = "Sops [D]ecrypt [F]ile";
      };
    }
  ];
}
