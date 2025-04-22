# Nivis

Still work in progress.
0.0.1 released the 11/11/24

## Constitution

1. Catppuccinist
2. Modular
3. Minimal

## Add-ons

Following article 2 LSP/DAP/tweaks for languages expect core/default ones(nix, yaml/json, md, shell/bash/nu) are optionals.
There are:

- [Python](./addons/py.nix) `nix run github:samos667/nivis#py`
- [Lua](./addons/lua.nix) `nix run github:samos667/nivis#lua`
- [Go](./addons/go.nix) `nix run github:samos667/nivis#go`
- [Terraform](./addons/tf.nix) `nix run github:samos667/nivis#tf`
- all of previous ones `nix run github:samos667/nivis#all`

And can be all used with the `all` add-ons

## S/O

I'm relatively new to Nvim and more globally IDE rabbit hole. There is some public dot that help me a lot to start to play around.
Especially:

- https://github.com/redyf/Neve
- https://github.com/GaetanLepage/nix-config
- https://github.com/ayamir/nvimdots

Also big thanks to all [Nixvim](https://github.com/nix-community/nixvim) contributors who make this possible.
