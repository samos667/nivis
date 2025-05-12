{
  # Terminal manager for (neo)vim --- https://github.com/voldikss/vim-floaterm
  plugins.floaterm = {
    enable = true;
    settings = {
      width = 0.8;
      height = 0.8;
      title = "";
    };
  };
  keymaps= [
    {
      mode = "n";
      key = "²";
      action = "<cmd>FloatermToggle<cr>";
    }
    {
      mode = "t";
      key = "²";
      action = "<cmd>FloatermToggle<cr>";
    }
  ];
}
