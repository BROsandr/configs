{
  programs.bash = {
    enable = true;
    profileExtra = "exec fish";
  };

  programs.direnv.enableBashIntegration = true;
}
