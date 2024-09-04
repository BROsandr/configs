{ ... }: {
  security.sudo.wheelNeedsPassword = true;

  users.users.alex = {
    isNormalUser = true;
    home = "/home/alex";
    extraGroups = [ "wheel" ];
    hashedPassword = "$y$j9T$iTvm77DrAaiZ2azO.dIk5/$DRksoKrOCLC7ZVc/HhEMxY8cV6IEtgkydnsq6qdINgC";
  };
}
