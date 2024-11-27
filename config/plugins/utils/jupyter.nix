{pkgs, ...}: {
  extraPackages = with pkgs; [
    python312Packages.jupytext
  ];

  plugins = {
    jupytext.enable = true;
    molten = {
      enable = true;
      settings = {
        image_provider = "image.nvim";
      };
    };
  };

  keymaps = [
    {
      mode = "v";
      key = "<leader>jr";
      action = ":<C-u>MoltenEvaluateVisual<CR>gv";
      options = {
        silent = true;
        desc = "execute visual selection";
      };
    }
    {
      mode = "n";
      key = "<leader>jj";
      action = ":noautocmd MoltenEnterOutput";
      options = {
        silent = true;
        desc = "show/enter output";
      };
    }
  ];

  extraConfigLua = ''
    -- Store the cursor position globally
    local stored_view = nil

    vim.keymap.set("n", "<leader>v#", function()
        -- Save the current view
        stored_view = vim.fn.winsaveview()

        -- Rest of your existing code
        vim.cmd([[silent! ?^# %%]])
        vim.cmd("normal! V")
        vim.cmd([[silent! /\(^# %%\)\|\%$/]])
        if vim.fn.line(".") < vim.fn.line("$") then
            vim.cmd("normal! k")
        end
    end, { silent = true, desc = "Select current # %% block" })

    vim.keymap.set("n", "<leader>jb", function()
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<leader>v#<leader>jr<Esc>", true, true, true), "x")

        -- Restore the view after a short delay
        vim.defer_fn(function()
            if stored_view then
                vim.fn.winrestview(stored_view)
                stored_view = nil  -- Clear the stored view
            end
        end, 0)
    end, { silent = true, desc = "Evaluate current # %% block" })

    -- New keymap for evaluating the next block
    vim.keymap.set("n", "<leader>jn", function()
        -- Evaluate the block using the existing jb command
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("nj<leader>jb", true, true, true), "x")
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("k", true, true, true), "x")

    end, { silent = true, desc = "Evaluate next # %% block" })
  '';
}
