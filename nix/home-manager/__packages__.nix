{pkgs, ...} : {
  home.packages = with pkgs; [
    wget
    tree
  ];
}
