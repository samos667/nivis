{...}: {
  plugins = {
    jupytext = {
      enable = true;
      settings = {
        custom_language_formatting = {
          python = {
            extension = "md";
            force_ft = "markdown";
            style = "markdown";
          };
        };
        output_extension = "auto";
        style = "light";
      };
    };
    molten = {
      enable = true;
      python3Dependencies = p:
        with p; [
          jupytext
          pynvim
          jupyter-client
          cairosvg
          ipython
          nbformat
          kaleido
          plotly
          pnglatex
          pyperclip
          svgwrite
          sympy
          tqdm
          cairosvg
          kaleido
          matplotlib
        ];
      settings = {
        auto_image_popup = false;
        output_win_max_height = 40;
        output_win_max_width = 80;
        save_path.__raw = "vim.fn.stdpath('data')..'/molten'";
        tick_rate = 100;
        wrap_output = true;
        image_provider = "image.nvim";
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>jj";
      action = ":noautocmd MoltenEnterOutput<CR>";
      options = {
        silent = true;
        desc = "show/enter output";
      };
    }
  ];
}
