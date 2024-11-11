{
  # Getting you where you want with the fewest keystrokes. -- https://github.com/ThePrimeagen/harpoon/tree/harpoon2
  plugins.harpoon = {
    enable = true;

    keymapsSilent = true;
    keymaps = {
      addFile = "<leader>a";
      toggleQuickMenu = "<C-e>";
      navFile = {
        "1" = "<C-&>";
        "2" = "<C-é>";
        "3" = "<C-\">";
        "4" = "<C-\'>";
      };
    };
  };
}
