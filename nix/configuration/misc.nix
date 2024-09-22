{ pkgs, ... } : {
  networking.hostName = "nixalex";
  time.timeZone = "Europe/Moscow";
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ polkit lxqt.lxqt-policykit libsForQt5.kwallet libsForQt5.kwalletmanager ];

  security = {
    pam.services.kwallet = {
      name = "kwallet";
      enableKwallet = true;
    };
  };

  security.pam.services.sddm.enableKwallet = true;
  security.pam.services.login.enableKwallet = true;

  security.polkit.enable = true;

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}
