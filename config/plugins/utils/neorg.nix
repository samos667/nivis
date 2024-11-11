{pkgs, ...}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      inherit (pkgs.luaPackages.lua-utils-nvim) pname version src;
    })

    (pkgs.vimUtils.buildVimPlugin {
      inherit (pkgs.luaPackages.pathlib-nvim) pname version src;
    })

    (pkgs.vimUtils.buildVimPlugin {
      inherit (pkgs.luaPackages.nvim-nio) pname version src;
    })
  ];
  plugins.neorg = {
    enable = true;
    modules = {
      "core.defaults".__empty = null;
      "core.itero".__empty = null;

      "core.export".markdown = {
        config = {
          extensions = "all";
        };
      };

      "core.keybinds".config.hook.__raw = ''
        function(keybinds)
          keybinds.unmap('norg', 'n', '<C-s>')
        end
      '';

      "core.dirman".config.workspaces = {
        notes = "~/notes";
        nix = "~/notes/nix";
      };

      "core.concealer".config.icon_preset = "basic";
      "core.completion".config.engine = "nvim-cmp";
      "core.qol.toc".config.close_after_use = true;
    };
  };
}
