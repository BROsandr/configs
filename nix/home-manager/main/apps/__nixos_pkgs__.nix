{pkgs, ...} : {
  home.packages = with pkgs; [
    gimp
    bibata-cursors
  ];
}