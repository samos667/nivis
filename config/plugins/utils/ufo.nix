{
  plugins.nvim-ufo = {
    enable = true;
    settings = {
      enable_get_fold_virt_text = true;
    };
  };
  # https://github.com/redhat-developer/yaml-language-server/issues/912
  extraConfigLua = ''
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
    }
    local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
    for _, ls in ipairs(language_servers) do
        require('lspconfig')[ls].setup({
            capabilities = capabilities
            -- you can add other fields for setting up lsp server in this table
        })
    end
    require('ufo').setup()
  '';
}
