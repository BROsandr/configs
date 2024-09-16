{
  networking.hostName = "nixalex";
  time.timeZone = "Europe/Moscow";
  nixpkgs.config.allowUnfree = true;
  services.gnome-keyring.enable = true;
}
