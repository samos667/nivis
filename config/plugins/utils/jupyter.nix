{pkgs, ...}: {
  extraPackages = with pkgs; [
    python312Packages.jupytext
  ];

  plugins = {
    jupytext.enable = true;
    molten = {
      enable = true;
      settings = {
        auto_image_popup = false;
        auto_init_behavior = "init";
        auto_open_html_in_browser = true;
        auto_open_output = true;
        cover_empty_lines = false;
        copy_output = false;
        enter_output_behavior = "open_then_enter";
        output_crop_border = true;
        output_virt_lines = false;
        output_win_border = ["" "━" "" ""];
        output_win_hide_on_leave = true;
        output_win_max_height = 15;
        output_win_max_width = 80;
        save_path.__raw = "vim.fn.stdpath('data')..'/molten'";
        tick_rate = 500;
        use_border_highlights = false;
        limit_output_chars = 10000;
        wrap_output = false;
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
      action = ":noautocmd MoltenEnterOutput<CR>";
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

        vim.fn.feedkeys('nzzzvj', 'n')
        vim.defer_fn(function()
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<leader>jb", true, true, true), "x")
        end, 100)

    end, { silent = true, desc = "Evaluate next # %% block" })
  '';
}
