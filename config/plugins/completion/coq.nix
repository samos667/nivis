{
  plugins.coq-nvim = {
    enable = true;
    settings = {
      auto_start = true;
    };
  };
  extraConfigLua = ''
    local lsp = require "lspconfig"
    local coq = require "coq"

    lsp.gopls.setup{}
    lsp.gopls.setup(coq.lsp_ensure_capabilities{})
    vim.cmd('COQnow')
  '';
}
