{
  imports = [
    "${fetchGit {
        url = "https://github.com/msteen/nixos-vscode-server";
        rev = "fc900c16efc6a5ed972fb6be87df018bcf3035bc";
      }}/modules/vscode-server/home.nix"
  ];

  services.vscode-server.enable = true;
  services.vscode-server.installPath = "$HOME/.vscode-server";
}
