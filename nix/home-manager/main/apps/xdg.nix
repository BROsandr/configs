{ pkgs, ... }:
{
  xdg.enable = false;

  xdg.mimeApps = {
    enable = false;
  };

  home.packages = with pkgs; [
    xdg-utils
  ];
}
