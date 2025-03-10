{pkgs, ...}: {
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      pname = "wezterm.nvim";
      version = "2024-10-26";
      src = pkgs.fetchFromGitHub {
        owner = "willothy";
        repo = "wezterm.nvim";
        rev = "032c33b621b96cc7228955b4352b48141c482098";
        hash = "sha256-q4PZUh4QdppeKGB0hytnZi2WBE6FRTcgieka6AnqQ5k=";
      };
    })
  ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>wv";
      action = ":lua require('wezterm').split_pane.vertical()<cr>";
      options = {
        silent = true;
        desc = "Add a vertical split pane";
      };
    }
    {
      mode = "n";
      key = "<leader>wh";
      action = ":lua require('wezterm').split_pane.horizontal()<cr>";
      options = {
        silent = true;
        desc = "Add a horizontal split pane";
      };
    }
  ];
}
