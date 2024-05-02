{ lib, ... }:
{
  nixos_imports = [
  ];

  non_wsl_imports = [
    ./vscode.nix
  ];

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
  ] ++ (if builtins.pathExists /etc/NIXOS then nixos_imports else [])
  ++ (if !(builtins.match ".*wsl.*" (lib.strings.toLower (builtins.readFile /proc/version))) then non_wsl_imports else []);
}
