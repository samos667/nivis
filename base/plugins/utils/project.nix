{pkgs, ...}: {
  extraPlugins = with pkgs.vimUtils; [
    (buildVimPlugin {
      pname = "cd-project.nvim";
      version = "2025-12-02";
      src = pkgs.fetchFromGitHub {
        owner = "LintaoAmons";
        repo = "cd-project.nvim";
        rev = "c7769e865609550d2f3d9a43c61e181affe43c2f";
        hash = "sha256-QwfvSHGnNPrx4vAoyIBZAC+2gmYu23kyc9HO7Wbw1UU=";
      };
      nvimSkipModules = [
        # Requires setup with corresponding provider
        "cd-project.adapter.telescope"
      ];
    })
  ];
  extraConfigLua = ''
    require("cd-project").setup({
      -- this json file is acting like a database to update and read the projects in real time.
      -- So because it's just a json file, you can edit directly to add more paths you want manually
      projects_config_filepath = vim.fs.normalize(vim.fn.stdpath("config") .. "/cd-project.nvim.json"),
      -- this controls the behaviour of `CdProjectAdd` command about how to get the project directory
      project_dir_pattern = { ".git", ".gitignore", "Cargo.toml", "package.json", "go.mod" },
      choice_format = "both", -- optional, you can switch to "name" or "path"
      projects_picker = "telescope", -- optional, you can switch to `telescope`
      auto_register_project = true, -- optional, toggle on/off the auto add project behaviour
      -- do whatever you like by hooks
      hooks = {
        {
          callback = function(_)
            require('persisted').load()
          end,
        },
      }
    })
  '';
  keymaps = [
    {
      mode = "n";
      key = "<leader>fd";
      action = ":CdProjectSearchAndAdd<cr>";
      options = {
        silent = true;
        desc = "Search project to add";
      };
    }
  ];
}
