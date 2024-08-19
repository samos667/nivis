{
  plugins.yanky = {
    enable = true;
    settings = {
      highlight = {
        on_put = true;
        on_yank = true;
        timer = 500;
      };
      picker = {
        telescope = {
          mappings = {
            default = "mapping.put('p')";
            i = {
              "<c-g>" = "mapping.put('p')";
              "<c-k>" = "mapping.put('P')";
              "<c-r>" = "mapping.set_register(utils.get_default_register())";
              "<c-x>" = "mapping.delete()";
            };
            n = {
              P = "mapping.put('P')";
              d = "mapping.delete()";
              gP = "mapping.put('gP')";
              gp = "mapping.put('gp')";
              p = "mapping.put('p')";
              r = "mapping.set_register(utils.get_default_register())";
            };
          };
        };
      };
      preserve_cursor_position = {
        enabled = true;
      };
    };
  };
}
