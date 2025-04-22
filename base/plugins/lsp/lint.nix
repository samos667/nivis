{pkgs, ...}: {
  # extraPackages = with pkgs; [
  #   codespell
  # ];

  plugins.lint = {
    enable = true;
    autoCmd = {
      callback = {
        __raw = ''
          function()
            require('lint').try_lint()
          end
        '';
      };
      event = "BufWritePost";
    };
  };
}
