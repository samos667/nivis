{
  luaLoader.enable = true;

  match.ExtraWhitespace = "\\s\\+$";
  imports = [
    ./plugins
    ./autocommands.nix
    ./keymappings.nix
    ./options.nix
  ];
}
