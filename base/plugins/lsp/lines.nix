{
  plugins.lsp-lines.enable = true;

  extraConfigLua = ''
    vim.diagnostic.config({ virtual_lines = { only_current_line = true } })
  '';
}
