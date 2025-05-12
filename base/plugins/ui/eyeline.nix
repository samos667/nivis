{pkgs, ...}: {
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      pname = "eyeliner.nvim";
      version = "2024-09-02";
      src = pkgs.fetchFromGitHub {
        owner = "jinh0";
        repo = "eyeliner.nvim";
        rev = "8f197eb30cecdf4c2cc9988a5eecc6bc34c0c7d6";
        hash = "sha256-qOMToZtBd39mdFZEr5WfIkHj+7TWeCPy2GJdIN+qOic=";
      };
    })
  ];
  extraConfigLua = ''
    require ("eyeliner").setup {
      highlight_on_key = true,
      dim = false,
      max_length = 9999,
      disabled_filetypes = {},
      disabled_buftypes = {},
      default_keymaps = true,
    }
  '';
}
