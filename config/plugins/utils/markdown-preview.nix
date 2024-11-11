{
  # markdown preview plugin for (neo)vim -- https://github.com/iamcco/markdown-preview.nvim
  plugins.markdown-preview = {
    enable = true;

    settings = {
      theme = "dark";
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>m";
      action = ":MarkdownPreview<cr>";
      options.silent = true;
    }
  ];
}
