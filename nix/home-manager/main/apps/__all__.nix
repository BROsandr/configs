{
  nixos_imports = [
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
  ] ++ (if builtins.pathExists /etc/NIXOS then nixos_imports else []);
}
