{
  programs.bash = {
    enable = true;

    # We cannot support the overpowered fish with ttf in tty so fallback to bash.
    profileExtra = if builtins.pathExists /etc/NIXOS then "" else "fish";
  };

  programs.direnv.enableBashIntegration = true;
}
