{
  plugins = {
    quarto = {
      enable = true;
      settings = {
        codeRunner = {
          default_method = "molten";
          enabled = true;
        };
        lspFeatures = {
          diagnostics = {
            enabled = true;
            triggers = [
              "BufWritePost"
            ];
          };
          enabled = true;
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>jc";
      action = ":lua require('quarto.runner').run_cell()<cr>";
      options = {
        silent = true;
        desc = "Run current cell";
      };
    }
    {
      mode = "n";
      key = "<leader>ju";
      action = ":lua require('quarto.runner').run_above()<cr>";
      options = {
        silent = true;
        desc = "Run current cell and above";
      };
    }
    {
      mode = "n";
      key = "<leader>jA";
      action = ":lua require('quarto.runner').run_all()<cr>";
      options = {
        silent = true;
        desc = "Run all cells";
      };
    }
    {
      mode = "n";
      key = "<leader>jl";
      action = ":lua require('quarto.runner').run_line()<cr>";
      options = {
        silent = true;
        desc = "Run current line";
      };
    }
    {
      mode = "v";
      key = "<leader>j";
      action = ":lua require('quarto.runner').run_line()<cr>";
      options = {
        silent = true;
        desc = "Run visual range";
      };
    }
  ];
}
