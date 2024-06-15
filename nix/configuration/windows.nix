{
  services.xserver = {
    enable = true;
    windowManager.i3 = {
      enable = true;
    };
    displayManager.lightdm = {
      enable = true;
    };

    xkb = {
      layout = "us,ru";
      # variant = "workman,";
      options = "grp:win_space_toggle";
    };
  };

  services.displayManager = {
    defaultSession = "none+i3";
    autoLogin = {
      enable = true;
      user   = "alex";
    };
  };
}
