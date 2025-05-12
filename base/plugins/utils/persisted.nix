{
  plugins.persisted = {
    enable = true;
    enableTelescope = true;
    settings = {
      use_git_branch = true;
      ignored_dirs = [
        "~/.config"
        "~/.local/nvim"
        {
          __raw = ''
            { "/", exact = true }
          '';
        }
        {
          __raw = ''
            { "/tmp", exact = true }
          '';
        }
      ];
    };
  };
  autoCmd = [
    {
      event = "User";
      pattern = "PersistedTelescopeLoadPre";
      callback.__raw = ''
        function(session)
          ignored_dir_list = {"/", "/tmp", "~/"}
          save = true
          for _, dir in ipairs(ignored_dir_list) do
            if cwd == dir then
              save = false
            end
          end
          if save == true then
            require("persisted").save({ session = vim.g.persisted_loaded_session })
          end
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            vim.api.nvim_buf_delete(buf, { force = true })
          end
        end
      '';
    }
  ];
  keymaps = [
    {
      mode = "n";
      key = "<leader>fp";
      action = "<cmd>Telescope persisted<cr>";
      options = {
        silent = true;
        desc = "Go to recent project";
      };
    }
    {
      mode = "n";
      key = "<leader>ql";
      action = "<cmd>SessionLoadLast<cr>";
      options = {
        silent = true;
        desc = "Restore last session";
      };
    }
  ];
}
