{
  plugins.yanky = {
    enable = true;
    settings = {
      highlight = {
        on_put = true;
        on_yank = true;
        timer = 500;
      };
      preserve_cursor_position = {
        enabled = true;
      };
      system_clipboard = {
        sync_with_ring = false;
      };
    };
  };
}
