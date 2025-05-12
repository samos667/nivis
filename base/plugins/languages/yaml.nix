{pkgs, ...}: {
  extraPackages = with pkgs; [
    yamllint
    nodePackages.jsonlint
    yamlfix
    jq
  ];

  # https://github.com/nix-community/nixvim/issues/989
  autoCmd = [
    {
      event = "FileType";
      pattern = "helm";
      command = "LspRestart";
    }
  ];

  plugins = {
    helm.enable = true;
    lsp.servers = {
      helm_ls = {
        filetypes = ["helm"];
        enable = true;
      };

      yamlls = {
        enable = true;
        filetypes = ["yaml"];
      };

      jsonls.enable = true;
    };

    lint = {
      lintersByFt = {
        yaml = [
          "yamllint"
        ];
        json = [
          "jsonlint"
        ];
      };
    };

    conform-nvim.settings = {
      formatters_by_ft = {
        yaml = [
          "yamlfix"
        ];
        json = [
          "jq"
        ];
      };
      formatters.yamlfix.env = {
        YAMLFIX_SECTION_WHITELINES = "1";
        YAMLFIX_COMMENTS_WHITELINES = "1";
      };
    };
  };
}
