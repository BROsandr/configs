{ pkgs, ... }: {
  security.sudo.wheelNeedsPassword = true;

  users.users.alex = {
    isNormalUser = true;
    home = "/home/alex";
    extraGroups = [ "wheel" "audio" "docker" ];
    hashedPasswordFile = "/etc/nixos/alex.passwd";
  };
}
