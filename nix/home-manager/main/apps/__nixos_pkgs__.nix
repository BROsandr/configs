{pkgs, ...} : {
  home.packages = with pkgs; [
    gimp
    bibata-cursors
    google-chrome

    telegram-desktop
  ];
}
