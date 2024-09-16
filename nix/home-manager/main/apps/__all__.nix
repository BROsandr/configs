{ lib, ... }:
let
  nixos_imports = [
    ./firefox.nix
    ./vscode-server.nix
    ./vscode.nix
    ./alacritty.nix
    ./waybar.nix
    ./hyprland.nix
    ./__nixos_pkgs__.nix
  ];

  non_wsl_imports = [
    ./wondershaper.nix
    ./fonts.nix
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
    ./sessionPath.nix
  ] ++ (if builtins.pathExists /etc/NIXOS then nixos_imports else [])
  ++ (if !helper.system.is_wsl then non_wsl_imports else []);
}
