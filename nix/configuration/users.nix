{ ... }: {
  users.users.alex = {
    isNormalUser = true;
    home = "/home/alex";
    extraGroups = [ "wheel" ];
    hashedPassword = "$y$j9T$ls1MRosiRSeCCoNpjrj0b0$IcRRJZz22u9tNtzVqNY6FSJ8JLUp/ERqEsj2fLy5nhD";
  };
}
