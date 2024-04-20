{pkgs, ...} : {
  home.packages = [
    pkgs.wget
    pkgs.meson
  ];
}
