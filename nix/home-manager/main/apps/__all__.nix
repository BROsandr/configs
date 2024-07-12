{ lib, ... }:
let
  nixos_imports = [
    ./firefox.nix
    ./i3.nix
  ];

  non_wsl_imports = [
    ./vscode.nix
    ./vscode-server.nix
    ./wondershaper.nix
    ./fonts.nix
    ./alacritty.nix
  ];

  helper = import ./.__helper__.nix;
in
{

  imports = [
    ./git.nix
    ./direnv.nix
    ./bash.nix
    ./fish.nix
    ./micro.nix
    ./bat.nix
    ./xdg.nix
    ./nnn.nix
    ./walk.nix
    ./tree.nix
    ./speedtest-cli.nix
  ] ++ (if builtins.pathExists /etc/NIXOS then nixos_imports else [])
  ++ (if !helper.system.is_wsl then non_wsl_imports else []);
}
