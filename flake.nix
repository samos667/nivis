{
  description = "Highly modular Nixvim declaration";

  inputs = {
    nixvim.url = "github:nix-community/nixvim";
    nixpkgs.follows = "nixvim/nixpkgs";
  };

  outputs = {
    nixvim,
    nixpkgs,
    ...
  }: let
    systems = ["x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin"];
    forAllSystems = nixpkgs.lib.genAttrs systems;

    # Centralized add-on definitions
    addons = {
      py = import ./addons/py.nix;
      go = import ./addons/go.nix;
      lua = import ./addons/lua.nix;
      tf = import ./addons/tf.nix;
      rs = import ./addons/rs.nix;
    };
  in {
    packages = forAllSystems (system: let
      nixvim' = nixvim.legacyPackages.${system};

      # Reusable module constructor
      mkNvimPackage = extraModules:
        nixvim'.makeNixvim ([
            (import ./base) # Base configuration
          ]
          ++ extraModules);

      # Generate individual add-on packages
      addonPackages =
        nixpkgs.lib.mapAttrs'
        (name: module: {
          name = name;
          value = mkNvimPackage [module];
        })
        addons;
    in
      {
        default = mkNvimPackage []; # Base configuration
        all = mkNvimPackage (builtins.attrValues addons); # All add-ons
      }
      // addonPackages); # Dynamically generated add-on specific packages
  };
}
