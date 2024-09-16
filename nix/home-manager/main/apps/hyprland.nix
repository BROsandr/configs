{ pkgs, ... } : {
  programs = {
    wofi.enable = true;
    wpaperd = {
      enable = true;
      settings = {
        default = {
          path = "~/.config/hypr/black_4k.png";
        };
      };
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };
}
