{
  plugins.conform-nvim = {
    enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>uf";
      action = ":FormatToggle<CR>";
      options = {
        desc = "Toggle Format";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>cf";
      action = "<cmd>lua require('conform').format()<cr>";
      options = {
        silent = true;
        desc = "Format Buffer";
      };
    }

    {
      mode = "v";
      key = "<leader>cF";
      action = "<cmd>lua require('conform').format()<cr>";
      options = {
        silent = true;
        desc = "Format Lines";
      };
    }
  ];

  opts.formatexpr = "v:lua.require'conform'.formatexpr()";
  # Custom command 'formatToggle'
  extraConfigLua = ''

    local conform = require("conform")

    conform.setup({
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_fallback = true }
      end,
    })

    local function show_notification(message, level)
      vim.notify(message, vim.log.levels[string.upper(level)] or vim.log.levels.INFO, { title = "conform.nvim" })
    end

    vim.api.nvim_create_user_command("FormatToggle", function(args)
      local is_global = not args.bang
      if is_global then
        vim.g.disable_autoformat = not vim.g.disable_autoformat
        if vim.g.disable_autoformat then
          show_notification("Autoformat-on-save disabled globally", "info")
        else
          show_notification("Autoformat-on-save enabled globally", "info")
        end
      else
        vim.b.disable_autoformat = not vim.b.disable_autoformat
        if vim.b.disable_autoformat then
          show_notification("Autoformat-on-save disabled for this buffer", "info")
        else
          show_notification("Autoformat-on-save enabled for this buffer", "info")
        end
      end
    end, {
      desc = "Toggle autoformat-on-save",
      bang = true,
    })
  '';
}
