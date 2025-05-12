{
  plugins = {
    cmp-nvim-lsp = {enable = true;};
    cmp-buffer = {enable = true;};
    cmp-path = {enable = true;};
    cmp_luasnip = {enable = true;};
    cmp-cmdline = {enable = false;};
    cmp-treesitter = {enable = true;};
    cmp_yanky = {enable = true;};
    cmp-spell = {enable = true;};
    cmp = {
      enable = true;
      autoEnableSources = false;
      settings = {experimental = {ghost_text = true;};};
      settings = {
        mapping = {
          __raw = ''
            cmp.mapping.preset.insert({
            ['<C-j>'] = cmp.mapping.select_next_item(),
            ['<TAB>'] = cmp.mapping.select_next_item(),
            ['<C-k>'] = cmp.mapping.select_prev_item(),
            ['<S-TAB>'] = cmp.mapping.select_next_item(),
            ['<C-e>'] = cmp.mapping.abort(),

            ['<C-b>'] = cmp.mapping.scroll_docs(-4),

             ['<C-f>'] = cmp.mapping.scroll_docs(4),

             ['<C-Space>'] = cmp.mapping.complete(),

             ['<CR>'] = cmp.mapping.confirm({ select = true }),

             ['<S-CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
            })
          '';
        };
        snippet = {
          expand = "function(args) require('luasnip').lsp_expand(args.body) end";
        };
        sources = [
          {name = "nvim_lsp";}
          {name = "path";}
          {
            name = "spell";
            option = {
              keep_all_entries = false;
              preselect_correct_word = true;
            };
          }
          {
            name = "luasnip";
          }
          {
            name = "buffer";
            # Words from other open buffers can also be suggested.
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          }
          {name = "treesitter";}
          {name = "cmp_yanky";}
        ];
        performance = {
          debounce = 60;
          fetching_timeout = 200;
          max_view_entries = 10;
        };
        window = {
          completion = {
            border = "rounded";
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None";
          };
          documentation = {border = "rounded";};
        };
        formatting = {
          fields = ["kind" "abbr" "menu"];
          expandable_indicator = true;
        };
      };
    };
  };
}
