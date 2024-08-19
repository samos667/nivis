{
  # Neovim Plugin to manage the file system and other tree like structures. -- https://github.com/nvim-neo-tree/neo-tree.nvim
  plugins.neo-tree = {
    enable = true;
    enableDiagnostics = true;
    enableGitStatus = true;
    enableModifiedMarkers = true;
    enableRefreshOnWrite = true;
    closeIfLastWindow = true;
    popupBorderStyle = "rounded"; # Type: null or one of “NC”, “double”, “none”, “rounded”, “shadow”, “single”, “solid” or raw lua code
    buffers = {
      bindToCwd = false;
      followCurrentFile = {
        enabled = true;
      };
    };
    window = {
      width = 40;
      height = 15;
      autoExpandWidth = false;
      mappings = {
        "<space>" = "none";
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = ":Neotree action=focus reveal toggle<CR>";
      options.silent = true;
    }
  ];
}
