{ pkgs, ... }: {
  security.sudo.wheelNeedsPassword = true;

  users.users.alex = {
    isNormalUser = true;
    home = "/home/alex";
    extraGroups = [ "wheel" "audio"  ];
    hashedPasswordFile = "/etc/nixos/alex.passwd";
  };
}
