{pkgs, ...}: {
  extraPackages = with pkgs; [
    python312Packages.jupytext
  ];

  plugins = {
    jupytext.enable = true;
    molten = {
      enable = true;
      settings = {
        image_provider = "image.nvim";
      };
    };
  };

  keymaps = [
    {
      mode = "v";
      key = "<leader>jr";
      action = ":<C-u>MoltenEvaluateVisual<CR>gv";
      options = {
        silent = true;
        desc = "execute visual selection";
      };
    }
    {
      mode = "n";
      key = "<leader>jj";
      action = ":noautocmd MoltenEnterOutput";
      options = {
        silent = true;
        desc = "show/enter output";
      };
    }
  ];
}
