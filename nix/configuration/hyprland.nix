{ pkgs, ... } : {
  programs.hyprland.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL   = 1;
  environment.sessionVariables.XCURSOR_THEME    = "Bibata-Modern-Classic";
  environment.sessionVariables.XCURSOR_SIZE     = 24;
  environment.sessionVariables.HYPRCURSOR_THEME = "Bibata-Modern-Classic";
  environment.sessionVariables.HYPRCURSOR_SIZE  = 24;
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
    };
    defaultSession = "hyprland";
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
