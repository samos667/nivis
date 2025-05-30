{
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
      term_colors = true;
      # styles = {
      #   # https://github.com/shaunsingh/nord.nvim/blob/master/lua/nord/theme.lua#L64-L69
      #   comments = ["italic"];
      #   conditionals = ["italic"];
      #   strings = ["italic"];
      #   functions = ["italic"];
      #   keywords = ["italic"];
      #   variables = ["italic"];
      # };
      integrations = {
        notify = true;
        lsp_saga = true;
        noice = true;
        telescope = {
          enabled = true;
          style = "nvchad";
        };
        lsp_trouble = true;
        which_key = true;
      };
    };
  };

  clipboard = {
    # Use system clipboard
    register = "unnamedplus";
    providers.wl-copy.enable = true;
  };

  diagnostics.settings = {
    virtual_lines = {
      only_current_line = true;
    };
    virtual_text = false;
  };

  opts = {
    # Enable relative line numbers
    conceallevel = 2;
    number = true;
    relativenumber = true;

    # Set tabs to 2 spaces
    tabstop = 2;
    softtabstop = 2;
    showtabline = 2;
    expandtab = true;

    # Enable auto indenting and set it to spaces
    smartindent = true;
    shiftwidth = 2;

    # Enable smart indenting (see https://stackoverflow.com/questions/1204149/smart-wrap-in-vim)
    breakindent = true;

    # Enable incremental searching
    hlsearch = true;
    incsearch = true;

    # Enable text wrap
    wrap = true;

    # Better splitting
    splitbelow = true;
    splitright = true;
    splitkeep = "screen";

    # Enable mouse mode
    mouse = "a"; # Mouse

    # Enable ignorecase + smartcase for better searching
    ignorecase = true;
    smartcase = true; # Don't ignore case with capitals
    grepprg = "rg --vimgrep";
    grepformat = "%f:%l:%c:%m";

    # Decrease updatetime
    updatetime = 50; # faster completion (4000ms default)

    # Set completeopt to have a better completion experience
    completeopt = ["menuone" "noselect" "noinsert"]; # mostly just for cmp

    # Enable persistent undo history
    swapfile = false;
    backup = false;
    undofile = true;

    # Enable 24-bit colors
    termguicolors = true;

    # Enable the sign column to prevent the screen from jumping
    signcolumn = "yes";

    # Enable cursor line highlight
    cursorline = true; # Highlight the line where the cursor is located

    # Set fold settings
    # These options were recommended by nvim-ufo
    # See: https://github.com/kevinhwang91/nvim-ufo#minimal-configuration
    foldcolumn = "0";
    foldlevel = 99;
    foldlevelstart = 99;
    foldenable = true;

    # Always keep 8 lines above/below cursor unless at start/end of file
    scrolloff = 8;

    # Reduce which-key timeout to 10ms
    timeoutlen = 10;

    # Set encoding type
    encoding = "utf-8";
    fileencoding = "utf-8";

    # Change cursor options
    guicursor = [
      "n-v-c:block" # Normal, visual, command-line: block cursor
      "i-ci-ve:ver15" # Insert, command-line insert, visual-exclude: vertical bar cursor with block cursor, use "ver25" for 25% width
      "r-cr:hor20" # Replace, command-line replace: horizontal bar cursor with 20% height
      "o:hor50" # Operator-pending: horizontal bar cursor with 50% height
      "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor" # All modes: blinking settings
      "sm:block-blinkwait175-blinkoff150-blinkon175" # Showmatch: block cursor with specific blinking settings
    ];

    # Enable chars list
    list = true; # Show invisible characters (tabs, eol, ...)
    listchars = "tab:|->,trail:•,extends:→,precedes:←,nbsp:␣";

    # More space in the neovim command line for displaying messages
    cmdheight = 2;

    # We don't need to see things like INSERT anymore
    showmode = false;

    # Maximum number of items to show in the popup menu (0 means "use available screen space")
    pumheight = 0;

    laststatus = 3; # (https://neovim.io/doc/user/options.html#'laststatus')
  };

  extraConfigLua = ''
    local opt = vim.opt
    local g = vim.g
    local o = vim.o
    local a = vim.api
      -- Neovide
    if g.neovide then
      -- Neovide options
      g.neovide_fullscreen = false
      g.neovide_refresh_rate_idle = 5
      g.neovide_floating_shadow = false
      g.neovide_cursor_vfx_particle_speed = 20.0
      g.neovide_cursor_vfx_mode = "ripple"
      g.neovide_cursor_smooth_blink = true
      g.transparency = 0
      g.neovide_opacity = 0.95
      g.neovide_floating_blur_amount_x = 2.0
      g.neovide_floating_blur_amount_y = 2.0
      vim.keymap.set("v", "<C-c>", '"+y', { noremap = true }) -- Select line(s) in visual mode and copy (CTRL+v)
      vim.keymap.set("i", "<C-v>", '<ESC>"+pa', { noremap = true }) -- Paste in insert mode (CTRL+c)
      vim.keymap.set("n", "<C-v>", '"+p', { noremap = true }) -- Paste in normal mode (CTRL+c)
      vim.keymap.set("c", "<C-v>", '<C-R>+', { noremap = true }) -- Paste in command mode (CTRL+c)

      -- Paste in "telescope" mode (CTRL+c)
      require('telescope').setup{
        defaults = {
          mappings = {
            i = {
              -- Map <C-y> to paste from the default register and stay in insert mode
              ["<C-v>"] = function()
                vim.cmd("normal! p")
                vim.cmd("startinsert!")
              end,
            },
          },
        },
      }

      -- Neovide Fonts
      o.guifont = "FiraCode Nerd Font:h16"
    end
  '';
}
