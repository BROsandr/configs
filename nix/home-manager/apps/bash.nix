{
  programs.bash = {
    enable = true;
    profileExtra = "fish";
  };

  programs.direnv.enableBashIntegration = true;
}
