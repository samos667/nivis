{
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
          kaleido
          matplotlib
        ];
      settings = {
        auto_image_popup = false;
        output_win_max_height = 40;
        output_win_max_width = 80;
        save_path.__raw = "vim.fn.stdpath('data')..'/molten'";
        wrap_output = true;
        output_virt_lines = true;
        output_crop_border = true;
        # image_provider = "image.nvim";
        cover_empty_lines = true;
        enter_output_behavior = "open_then_enter";
        auto_open_output = false;
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
