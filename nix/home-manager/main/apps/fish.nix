{ pkgs, ... }:
{
  programs.fish = rec {
    enable = true;
    plugins = [
      # oh-my-fish plugins are stored in their own repositories, which
      # makes them simple to import into home-manager.
      {
        name = "timer";
        src = pkgs.fetchFromGitHub {
          owner = "jichu4n";
          repo = "fish-command-timer";
          rev = "ba68bd0a1d06ea99aadefe5a4f32ff512783d432";
          hash = "sha256-Ip677gZlcO8L/xukD7Qoa+C+EcI2kGd+BSOi2CDOzM4=";
        };
      }
    ];
    shellInitLast = ''
      set fish_command_timer_time_format '%b %d %H:%M'
    '';

    shellAliases.nix-shell = "nix-shell --run fish";
  };
}
